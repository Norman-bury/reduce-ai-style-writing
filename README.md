# reduce-ai-style-writing

`reduce-ai-style-writing` 是一个面向中文论文的通用 AI 写作规则包 / skill，用于把论文段落中“过于规整、过于精致、过于像 AI 生成”的表达改成更普通的正式论文文本。目前针对降低 AI 率可以达到一个非常优秀的效果，跟市面的付费工具效果接近。希望大家在使用过程中积极反馈，我这边会不断优化。

它的目标不是承诺某个检测器分数，而是在保留术语、事实、引用、数据边界和结论边界的前提下，降低明显的模板化句式和 AI 写作痕迹。

本仓库不只适用于 Codex。只要你的 AI 编程助手、编辑器或命令行代理可以读取 Markdown 规则文件，就可以使用本仓库，例如 Codex、Claude Code、Cursor、Cline、Roo Code、Gemini CLI 等。

## 目录

```text
reduce-ai-style-writing/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
│   ├── boundary-rules.md
│   ├── intro-rules.md
│   ├── literature-rules.md
│   ├── method-rules.md
│   └── replacement-library.md
└── scripts/
    └── ai_style_scan.ps1
```

## 安装与接入

### Codex

```powershell
git clone https://github.com/Norman-bury/reduce-ai-style-writing "$env:USERPROFILE\.codex\skills\reduce-ai-style-writing"
```

如果已经下载到本地，也可以直接复制整个 `reduce-ai-style-writing/` 目录到 Codex skills 目录：

```text
C:\Users\<用户名>\.codex\skills\reduce-ai-style-writing
```

### Claude Code、Cursor、Cline、Roo Code 等

这些工具未必使用 Codex 的 `skills/` 目录结构。通用做法是：

1. 克隆或下载本仓库。
2. 在你的工具规则文件中引用本仓库的 `SKILL.md`。
3. 改写具体段落时，让工具按 `SKILL.md` 的流程执行，并在需要时读取 `references/` 中对应规则。

可以直接把下面这段放进 `CLAUDE.md`、`AGENTS.md`、`.cursorrules` 或其他项目规则文件中：

```text
When rewriting Chinese academic paragraphs to reduce AI-like phrasing, use the rules in reduce-ai-style-writing/SKILL.md. Preserve terminology, facts, citations, numbers, data boundaries, and claim boundaries. For paragraph-specific details, read the relevant files under reduce-ai-style-writing/references/.
```

如果你的工具支持直接附加上下文，也可以把 `SKILL.md` 和相关 `references/*.md` 文件作为上下文文件提供给模型。

## 使用方式

在支持 skill 的工具中，可以直接点名使用：

```text
用 reduce-ai-style-writing 改写下面这段，降低 AI 率。

原文：
[粘贴待改写的中文论文段落]
```

也可以要求只输出可粘贴正文：

```text
用 reduce-ai-style-writing 改写下面这段，只输出改写后的正文，不要解释。
```

如果工具不支持 skill 名称，可以改成：

```text
请按照 reduce-ai-style-writing/SKILL.md 的规则改写下面这段中文论文文本，降低 AI 写作痕迹，同时保留术语、事实、引用、数值和结论边界。
```

默认输出包含两部分：

```text
改写后：
[连续段落]

字词级修改说明：
[5-8 个关键替换]
```

## 适用文本

- 论文摘要、引言、研究缺口和贡献说明
- 方法、模型、框架和实验设计描述
- 文献综述和背景介绍
- 数据边界、局限性和适用范围说明
- 结果分析和结论段落

## 工作原则

- 保留模型名、方法名、指标、数据集、地点、引用编号、变量和数值。
- 不新增实验结果、数据来源、文献结论或适用范围。
- 优先调整句式骨架，而不是只替换形容词。
- 保持论文正文的基本规范，避免低质量口语化和病句。
- 不承诺任何 AI 检测器一定降到某个百分比。

## 辅助扫描脚本

`scripts/ai_style_scan.ps1` 可以扫描 Markdown 文件中的高风险模板化表达，适合改写前后做人工复查：

```powershell
powershell -ExecutionPolicy Bypass -File scripts\ai_style_scan.ps1 -FilePath path\to\chapter.md
```

脚本只是表面扫描，命中结果需要人工判断，不等同于检测器结论。

## 维护规则

后续如果有新的“改写前/改写后”样本，先做词级和句式骨架对比，再把稳定规则补进 `references/`：

- `intro-rules.md`：引言、动机、缺口、贡献
- `method-rules.md`：方法、模型、技术流程
- `literature-rules.md`：文献综述和背景
- `boundary-rules.md`：数据边界、局限性、适用范围
- `replacement-library.md`：可复用替换方向

不要把一次性的领域样本直接扩展成通用规则。
