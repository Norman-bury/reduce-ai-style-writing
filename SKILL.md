---
name: reduce-ai-style-writing
description: Use when rewriting Chinese论文/摘要/引言/方法/结果分析/局限性 text to lower AI rate or AI traces, or when building prompts for Chinese论文去AI化改写 while preserving terminology, facts, citations, data boundaries, and thesis logic.
---

# Reduce AI Style Writing

Use this skill to rewrite Chinese academic writing into lower-template, lower-AI-trace prose. The goal is not prettier polishing. The goal is to keep the paper content intact while lowering the highly regular sentence skeletons common in AI-generated papers.

Do not promise any detector score. Treat detector results as feedback samples, then improve the prompt and rules from word-level comparisons.

## Workflow

1. Identify the paragraph type before rewriting:
   - Introduction, motivation, research gap, or contribution statement
   - Method or model description
   - Literature review or background
   - Data boundary, limitation, or scope statement
   - Result analysis or conclusion

2. Preserve hard content:
   - Keep model names, method names, metrics, datasets, locations, citations, variables, and numbers.
   - Do not add facts, delete constraints, change citation numbers, or change the claim boundary.

3. Reduce the sentence skeleton, not only individual adjectives:
   - Replace formal connectors and verbs such as `以...作为`, `用于`, `引入`, `采用`, `通过`, `围绕...展开`, `考察`, `协同作用`, `分别评价`.
   - Prefer ordinary structures such as `用...做`, `用来`, `加上`, `用`, `主要研究`, `配合效果`, `对...进行评价`.
   - Check function words and sentence tails, not only content words. Residual markers such as `能否`, `直接影响`, `对于...而言`, `不可忽略`, `重要方向`, `同一评价链条`, and `主要贡献在于` often keep the AI rate high.
   - When a sample proves effective, change the local skeleton too: `既反映 A，也可能暴露 B` can become `既可以显示 A，也可以显示 B`; `不同主体通常具有不同 X` can become `不同主体所拥有的 X 是不一样的`.

4. Apply paragraph-specific rules:
   - For introduction, motivation, research gap, and contribution paragraphs, read `references/intro-rules.md`.
   - For method descriptions, read `references/method-rules.md`.
   - For literature/background paragraphs, read `references/literature-rules.md`.
   - For data boundaries, limitations, domain shift, and scope statements, read `references/boundary-rules.md`.
   - For reusable phrase mappings, read `references/replacement-library.md`.

5. Produce output in this shape unless the user asks otherwise:

```text
改写后：
[continuous rewritten paragraph(s)]

字词级修改说明：
[5-8 concise replacements, such as "以 A 作为 B -> 用 A 做 B"]
```

When the user only wants paste-ready text, output `改写后` only.

## Core Rules

- Prefer ordinary academic prose over polished journal-style prose.
- Keep the writing formal enough for a thesis, but allow a controlled drop in wording level.
- Avoid making the text too smooth, too symmetrical, or too uniformly structured.
- Prefer word-level downgrades that change the frame of the sentence. Changing `表明` to `显示` is weaker than changing `已有研究表明，A 已经成为 B` to `已有研究显示，A 是 B`.
- Avoid low-quality oral phrasing, obvious grammar errors, and factual drift.
- Keep paragraph logic and chapter role. Do not turn method, result, limitation, and conclusion sections into the same style.

## Quick Rewrite Prompt

Use this prompt when the user asks for a reusable prompt:

```text
你是一名中文论文降 AI 改写编辑。你的任务不是把文本润色得更高级，而是降低文本中“过于规整、过于精致、过于像 AI 生成论文”的表达，使其更接近人工撰写的普通正式论文文本。

请先判断段落类型：引言动机/研究缺口/贡献说明、方法介绍、文献综述、数据边界/局限说明、结果分析或结论。不同段落使用不同降档策略。

保留专业内容：模型名、方法名、指标名、材料名、数据集名、地点、引用编号、实验路径、数据边界和结论边界不得改动。不得新增事实，不得删减关键信息。

重点降低句式骨架：处理“正在从……转向、已有研究指出/表明、直接影响、能否、提供直接路径、进一步说明、对于……而言、不可忽略、重要方向、以……作为、用于、引入、采用、通过、考察、协同作用、分别评价、围绕……展开、不能被解释为、仅在……条件下、避免扩展为普遍结论”等模板结构。优先改成“逐渐转到、已有研究显示、都会影响到、是否可以、开辟了一条途径、表明、……的评价不能只停留在、不可忽视、研究重点、用……做、用来、加入/加上、用、研究、配合效果、对……进行评价、不能解释出、只在……范围内、不能把……当作……”等更普通的表达。

引言类段落要额外看字词细节：把“这些流量既反映 A，也可能暴露 B”改成“流量既可以显示 A，也可以显示 B”；把“不同工厂通常具有不同 X”改成“不同工厂所拥有的 X 是不一样的”；把“如果评价仍停留在 X 上，Y 难以被检验”改成“评价不能只停留在 X 上，Y 也就无法被检验”。这类改法比单纯替换“指出/表明”更有效。

不要只替换形容词，要改变句子组织方式。允许句子变得没有那么精致，但必须保持论文正文基本规范，不能写成病句或低质量口语。

输出前自查：术语是否保留，事实是否未变，引用是否未变，限制边界是否未变，句子是否通顺。

输出格式：
改写后：
[只输出改写后的连续段落]

字词级修改说明：
[列出 5-8 个关键替换]

原文：
[粘贴待改写段落]
```

## Iteration Protocol

When the user provides `改写前/改写后` examples:

1. Compare at word and skeleton level.
2. Separate effective changes from quality risks.
3. Add stable mappings to `references/replacement-library.md` only after repeated evidence.
4. Add paragraph-type rules to the relevant reference file.
5. Do not generalize one domain-specific example into a universal rule.
