#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import json
import subprocess
import sys
from functools import reduce
from typing import Optional, TypedDict


class Model(TypedDict):
    id: str
    display_name: str


class Workspace(TypedDict):
    current_dir: str
    project_dir: str


class OutputStyle(TypedDict):
    name: str


class Cost(TypedDict):
    total_cost_usd: float
    total_duration_ms: int
    total_api_duration_ms: int
    total_lines_added: int
    total_lines_removed: int


class CurrentUsage(TypedDict):
    input_tokens: int
    output_tokens: int
    cache_creation_input_tokens: int
    cache_read_input_tokens: int


class ContextWindow(TypedDict):
    total_input_tokens: int
    total_output_tokens: int
    context_window_size: int
    current_usage: Optional[CurrentUsage]


class StatusHookEvent(TypedDict):
    hook_event_name: str
    session_id: str
    transcript_path: str
    cwd: str
    model: Model
    workspace: Workspace
    version: str
    output_style: OutputStyle
    cost: Cost
    context_window: ContextWindow


def with_pwd_and_git(e: StatusHookEvent, stl: str) -> str:
    cwd_res = get_cwd()
    git_branch_res = get_git_branch()
    if cwd_res is None and git_branch_res is None:
        return stl
    if cwd_res is None:
        return f"{git_branch_res.strip('on ')}"
    if git_branch_res is None:
        return f"{cwd_res}"
    return f"{cwd_res}{git_branch_res}"


def with_context_stats(e: StatusHookEvent, stl: str) -> str:
    context_percent = get_context_left_percentage(e)
    cost = get_cost(e)
    model = get_model(e)
    return f"Project: {stl}\nContext left: {context_percent}% | Cost: ${cost:.2f} | Model: {model}"


# Helpers


def get_git_branch() -> Optional[str]:
    try:
        res = (
            subprocess.check_output(["starship", "module", "git_branch"])
            .decode("utf-8")
            .strip("")
        )
        if len(res) == 0:
            return None
        return res

    except Exception:
        return None


def get_cwd() -> Optional[str]:
    try:
        res = (
            subprocess.check_output(["starship", "module", "directory"])
            .decode("utf-8")
            .strip("")
        )
        if len(res) == 0:
            return None
        return res

    except Exception:
        return None


def get_model(e: StatusHookEvent) -> Optional[str]:
    return e["model"]["display_name"]


def get_context_left_percentage(e: StatusHookEvent) -> int:
    context_window = e["context_window"]
    total_tokens = (
        context_window["total_input_tokens"] + context_window["total_output_tokens"]
    )
    total_context = context_window["context_window_size"]
    return 100 - int((total_tokens / total_context) * 100)


def get_cost(e: StatusHookEvent) -> float:
    return e["cost"]["total_cost_usd"]


def main():
    ev: StatusHookEvent = json.load(sys.stdin)
    modifiers = [with_pwd_and_git, with_context_stats]
    status_line = reduce(lambda acc, mod: mod(ev, acc), modifiers, "")
    print(status_line)


main()
