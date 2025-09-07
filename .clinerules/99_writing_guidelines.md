#  Writing Guide

**Goal:** enable any reader to understand what this workspace means, why to use it, how to use it now, and how to fix common issues. Minimize friction and time to first success.

---

## 1) Core Principles

* **Write for action.** Every section should let the reader do something: install, run, integrate, debug.
* **Outcome first.** Tie each instruction to a user goal such as build, sync data, deploy.
* **Time to first success ≤ 5 minutes.** Optimize for a first working result quickly.
* **Avoid adjectives; use evidence.** Prefer numbers, limits, and preconditions to vague claims.
* **Show, do not just tell.** Real, reproducible examples beat abstract descriptions.
* **Scannable without being fragmented.** Clear prose plus lists when they help execution.
* **Every sentence must earn its place.** If it does not help understand or do, remove it.

---

## 2) Titles That Promise Value

Avoid “How to use X with Y”. Prefer titles that express user goal, audience, and when helpful a time window.

**Patterns**

* Configure **{tool}** for **{result}** in **{time}**
* **{Result}** with **{tool}** for **{audience}**
* From **{current state}** to **{desired state}** using **{tool}**

**Examples**

* Collect structured logs in 5 minutes with LogKit
* Lightweight CI for JavaScript monorepos (no Docker) with RunLite
* Migrate local cron jobs to JobsCloud in 15 minutes

---

## 3) Evidence Over Adjectives

Replace “production ready” or “blazingly fast” with measurable data.

* Scale: tested with **100** workers or **1 million** events per minute
* Latency: p95 **< 200 ms** at **10k** messages in queue
* Resources: steady **\~0.3 CPU**, memory **< 128 MB**

**Three U test**

* **Visualizable**: logs, metrics, or screenshots can show it
* **Falsifiable**: others can reproduce and disagree with data
* **Unique**: something only you or this tool can honestly claim here

---

## 4) Standard Page Structure

1. **What it is and when to use it**
   One to two short paragraphs with positioning and three common use cases.
2. **Get started now (≤ 5 minutes)**
   Prerequisites, install, first command or flow, success check.
3. **Task recipes**
   Three to five frequent tasks with short steps and a final check.
4. **Real example (copy-paste)**
   A complete file or full snippet with comments.
5. **Inspiration**
   Three ideas to scale, integrate, or automate next.
6. **Troubleshooting**
   Map error to cause to fix with a verification command.
7. **Essential reference**
   Flags, environment variables, limits, and defaults in compact tables.
8. **Compatibility and versions**
   OS, architectures, version constraints, notable behavior changes.

Note: blend “where it is” and “how to use” when natural. Location and action should flow together.

---

## 5) Reusable Blocks

### 5.1 Quickstart

* **Prerequisites**
  OS and version, permissions, ports, SDKs.
* **Install**
  A single command plus an offline alternative if relevant.
* **First use**
  One working command with expected output.
* **Verify**
  Clear success criteria such as an exit code or log line.

### 5.2 Task Recipe

* **Goal**: schedule a daily job at 02:00
* **Steps**

  1. …
  2. …
* **Verify**
  `jobs list` shows `next_run: 02:00`
* **Rollback**
  Revert command if applicable

### 5.3 Troubleshooting Table

| Exact error message  | Likely cause           | Fix                          | Verify               |
| -------------------- | ---------------------- | ---------------------------- | -------------------- |
| `permission denied`  | folder ownership       | `chown -R $USER …`           | `whoami && ls -ld …` |
| `ECONNREFUSED :5432` | database not listening | `systemctl start postgresql` | `pg_isready`         |

---

## 6) Style and Tone

* **Direct, technical, human.** No fluff. Avoid unnecessary jargon.
* **Second person (“you”).** Guide action without hand-holding.
* **No emojis; avoid long em dashes.** Use simple punctuation.
* **Use established English technical terms** and define on first mention if needed.

**Formatting**

* Commands in code blocks; prefix `$` only in shell examples.
* Paths, keys, and flags in `monospace`.
* Quote exact error messages with backticks.

---

## 7) Accessibility and Scannability

* Headings every three to four paragraphs.
* Short lists for steps and alternatives.
* Generous white space.
* Images and videos with captions and alt text.
* Callouts for tips, notes, and warnings where they add context.

---

## 8) Code and Examples

* **End-to-end runnable.** Avoid pseudocode that cannot be executed.
* **Specify environment.** OS, versions, shell, dependencies.
* **No magic ellipses** where the reader must copy content.
* **Include validation.** What to expect in terminal, logs, or HTTP response.
* **Platform differences.** Separate macOS, Linux, Windows variations clearly.

---

## 9) Crosslinking and Navigation

At the end of each page, add links to:

* Install guide, CLI or API reference, related integrations
* Next-step tutorials such as CI, observability, or scaling

Every page should point to a next step. Avoid documentation islands.

---

## 10) Anti-patterns and Fixes

**Bad**

* **Install:** …
* **Configure:** …
* **Run:** …

**Better**
Install the binary with `curl | sh`. Initialize with `tool init` to generate `tool.yaml`. If the command prints `READY`, create your first job with `tool job create`.

---

## 11) Definition of Done Checklist

* [ ] Time to first success ≤ 5 minutes on a clean machine
* [ ] Copy-paste example runs start to finish
* [ ] Common errors mapped to fixes with verification steps
* [ ] Limits and defaults documented
* [ ] OS differences covered if applicable
* [ ] Crosslinks to related pages
* [ ] No empty adjectives; claims have numbers or criteria
* [ ] Screens or logs show date and version when relevant
* [ ] Cold reader review completed

---

## 12) Templates

### 12.1 Feature Page Template

````md
# {Outcome} with {Tool} ({time})

## What it is and when to use it
{1–2 paragraphs with positioning and top use cases}

## Get started (≤ 5 minutes)

**Prerequisites**
- …

**Install**
```bash
$ …
````

**First use**

```bash
$ …
# expected output:
# …
```

**Verify**

* …

## Task recipes

### {Task 1}

1. …
2. …
   **Verify:** …

### {Task 2}

1. …
2. …
   **Verify:** …

## Real example

```yaml
# tool.yaml
…
```

## Troubleshooting

| Error | Cause | Fix | Verify |
| ----- | ----- | --- | ------ |
| …     | …     | …   | …      |

## Essential reference

| Flag        | Default | Description |
| ----------- | ------: | ----------- |
| `--workers` |       4 | …           |

## Compatibility and versions

* macOS 13+, Linux x86\_64 and arm64, Windows 11
* Requires {SDK, port, or dependency}

## See also

* {related link 1}
* {related link 2}

````

### 12.2 Quick Recipe Template

```md
## {Task}: {short outcome}

**Prerequisites:** …

1) …
2) …
3) …

**Verify**
```bash
$ …
# expect: …
````

**Rollback (optional)**

```bash
$ …
```

```

---

## 13) Before and After Examples

**Before**  
How to use SyncX with Y database

**After**  
Sync 1 million rows from Y database in 10 minutes with SyncX (no downtime)

**Before**  
SyncX is very fast and easy to use.

**After**  
SyncX applies batches of **10k** records, keeps p95 **< 250 ms**, and resumes from the last offset after network failures.

---

## 14) Language Policy

- No emojis.  
- Avoid long em dashes; prefer simple punctuation.  
- Do not anthropomorphize unless the brand requires it. Refer to the tool by name.

---

## 15) Post-publication Maintenance

- Version examples with explicit tag or commit.
- Monitor issues and add newly frequent errors to troubleshooting.
- Re-measure time to first success on releases that alter install or prerequisites.
```
