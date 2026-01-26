import { $ } from "bun";
import { parseArgs } from "util";

interface ClaudeCodePluginItemOutput {
  id: string;
  version: string;
  scope: "user" | "project" | "local";
  enabled: boolean;
  installPath: string;
  installedAt: string;
  lastUpdated: string;
  projectPath?: string;
}
async function main() {
  const { values } = parseArgs({
    args: Bun.argv,
    options: {
      agent: { type: "string", short: "a" },
    },
    allowPositionals: true,
  });

  if (!values.agent) {
    throw new Error(
      "Agent is required. Use -a or --agent to specify the agent.",
    );
  }

  switch (values.agent) {
    case "claude-code":
      await setupClaudeCode();
      break;
    case "open-code":
      await setupOpenCode();
      break;
    default:
      throw new Error(
        "Unexpected Agent, eexpected one of: `claude-code`, `open-code`",
      );
  }
}
try {
  await main();
} catch (error) {
  if (error instanceof Error) {
    console.error(error.message);
  } else {
    console.error("Unexpected Error", error);
  }
  process.exit(1);
}
interface ClaudeCodeMarketplace {
  name: string;
  source: string;
  url?: string;
  repo?: string;
  installLocation: string;
}

async function setupClaudeCode() {
  const MARKETPLACE_NAME = "superpowers-marketplace";
  const MARKETPLACE_REPO = "obra/superpowers-marketplace";
  const PLUGIN_ID = "superpowers@superpowers-marketplace";

  if ((await $`which claude`.quiet()).exitCode !== 0) {
    throw new Error("Claude Code not found. Please install it first.");
  }

  // Check if superpowers plugin is already installed
  const ccPlugins: ClaudeCodePluginItemOutput[] =
    await $`claude plugin list --json`.json();
  const isInstalled = ccPlugins.some((p) => p.id === PLUGIN_ID);
  if (isInstalled) {
    console.log("superpowers is already installed. Skipping.");
    return;
  }

  // Check if marketplace is registered
  const marketplaces: ClaudeCodeMarketplace[] =
    await $`claude plugin marketplace list --json`.json();
  const hasMarketplace = marketplaces.some((m) => m.name === MARKETPLACE_NAME);
  if (!hasMarketplace) {
    console.log(`Adding marketplace: ${MARKETPLACE_REPO}`);
    await $`claude plugin marketplace add ${MARKETPLACE_REPO}`;
  }

  // Install the plugin
  console.log(`Installing plugin: ${PLUGIN_ID}`);
  await $`claude plugin install ${PLUGIN_ID}`;

  console.log("superpowers installed successfully for Claude Code.");
}

async function setupOpenCode() {
  const SUPERPOWERS_REPO = "https://github.com/obra/superpowers.git";
  const homeDir = process.env.HOME || process.env.USERPROFILE;
  if (!homeDir) {
    throw new Error("Could not determine home directory");
  }

  const configDir = `${homeDir}/.config/opencode`;
  const superpowersDir = `${configDir}/superpowers`;
  const pluginDir = `${configDir}/plugin`;
  const skillsDir = `${configDir}/skills`;
  const pluginSource = `${superpowersDir}/.opencode/plugin/superpowers.js`;
  const commandsSource = `${superpowersDir}/commands`;
  const pluginLink = `${pluginDir}/superpowers.js`;
  const commandsDir = `${configDir}/commands`;
  // Clone or update superpowers repo
  const { existsSync } = await import("fs");
  if (existsSync(superpowersDir)) {
    console.log(`Updating existing repo at ${superpowersDir}`);
    await $`git -C ${superpowersDir} pull`;
  } else {
    console.log(`Cloning superpowers to ${superpowersDir}`);
    await $`mkdir -p ${configDir}`;
    await $`git clone ${SUPERPOWERS_REPO} ${superpowersDir}`;
  }

  // Create directories
  await $`mkdir -p ${pluginDir}`;
  await $`mkdir -p ${skillsDir}`;
  await $`mkdir -p ${commandsDir}`;
  console.log(`Created ${pluginDir}`);

  console.log(`Created ${skillsDir}`);
  console.log(`Created ${commandsDir}`);

  // Create symlink for plugin
  if (existsSync(pluginLink)) {
    await $`rm ${pluginLink}`;
  }

  if (existsSync(pluginSource)) {
    await $`ln -sf ${pluginSource} ${pluginLink}`;
    console.log(`Linked ${pluginLink} -> ${pluginSource}`);
  } else {
    console.warn(`Warning: Plugin source not found at ${pluginSource}`);
  }

  if (existsSync(commandsSource)) {
    await $`ln -sf ${commandsSource} ${commandsDir}/superpowers`;
    console.log(`Linked ${commandsDir} -> ${commandsSource}`);
  } else {
    console.warn(`Warning: Commands source not found at ${commandsSource}`);
  }

  console.log("\nRestart OpenCode to load the plugin.");
  console.log("Verify by asking: 'do you have superpowers?'");
}
