# Method Description Rules

Use these rules for paragraphs that introduce a method, model, framework, module, experiment design, or technical pipeline.

## High-Risk Skeletons

| High AI-risk expression | Lower-template direction |
|---|---|
| 基于上述分析 | 根据以上分析 |
| 本文提出一种结合 A 与 B 的方法 | 本文提出一种 A 和 B 相结合的方法 |
| 以 A 作为 B | 用 A 做 B |
| 用于提取 | 提取 / 用来提取 |
| 具有...表达能力 | 包含...信息 / 能表达... |
| 多层级 | 多层 |
| 注意力相关 | 和注意力有关 |
| 引入 | 加入 / 加上 |
| 以较小参数完成适配 | 用较少参数来适应任务 |
| 采用...解码器 | 用...解码器 |
| 通过...实现 | 用...来完成 |
| 以改善 | 从而提高 / 用来改善 |
| 考察...协同作用 | 研究...配合效果 |
| 实验设计围绕...展开 | 实验部分主要对...进行评价 |
| 分别评价 | 从...方面评价 / 进行...评价 |

## Rewrite Pattern

Before:

```text
该方法以 A 作为主干，用于提取具有 B 表达能力的特征；在 C 层引入 D，以较小参数完成任务适配；采用 E 解码器生成结果，以改善 F。
```

After:

```text
该方法用 A 做主干，提取包含 B 信息的特征，在 C 层加上 D，用较少参数来适应任务；再用 E 解码器生成结果，从而提高 F。
```

## Guardrails

- Keep algorithm names, module names, and task names unchanged.
- Do not weaken technical relationships into vague wording.
- Do not add unsupported performance claims.
- Do not force every `采用` to `用` if the resulting sentence becomes awkward; sentence quality still matters.
