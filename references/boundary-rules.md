# Boundary, Limitation, and Scope Rules

Use these rules for data design, domain shift, limitations, applicability, and conclusion-boundary paragraphs.

## High-Risk Skeletons

| High AI-risk expression | Lower-template direction |
|---|---|
| 主数据集采用 A | 主数据集用 A |
| 承担...数据来源角色 | 是...数据来源的主体 / 是...主要来源 |
| 覆盖...正常流量与攻击流量 | 包含...正常流量和攻击流量 |
| 作为...保留在...位置 | 被保留到...处 |
| 不参与...调参 | 不会参与到...调参中 |
| 而是用于观察 | 只是用来检验 / 只是用来观察 |
| 承担不同职责 | 起着不同的作用 |
| 负责给出主要比较结果 | 给出主要比较结果 |
| 不能混用为同一轮调参依据 | 不能混用为同一个轮调参的依据 |
| 为了避免 | 为了防止 |
| 悄然变成 | 悄悄变成 |
| 将...视为实验输入的一部分 | 把...当作实验输入的一部分 |
| 进入模型前 | 进入模型之前 |
| 若某一数据集 | 如果某个数据集 |
| 只有在...时才保留 | 在...情况下才保留 |
| 只留在单数据集内部分析中 | 只在单个数据集中进行分析 |
| 沿同一预处理管线 | 沿着同一个预处理管道 |
| 削弱后续比较的可比性 | 影响后面比较的可比性 |
| 从...看 | 从...情况可以看出 |
| 主要差异来自两个层面 | 主要的不同是两种 |
| 主要反映 | 主要是反映 |
| 进一步引入 | 又加入了 |
| 两类差异 | 两类差别 |
| 共同构成 / 共同形成 | 一起成为 |
| 实际应用 | 实际运用 |
| 典型挑战 / 常见挑战 | 常见的难题 |
| 能够支持对...的评价 | 可以评价... |
| 模型迁移表现 | 模型迁移的表现 |
| 不能被解释为 / 不能说明 | 不能解释出 |
| 仅在...条件下 | 只在...范围内以及...输入下 |
| 不将...纳入主线 | 并没有把...纳入主线 |
| 后续实验结果中的... | 后续实验结果中出现的... |
| 应结合 | 需要依照 |
| 本章定义的数据边界 | 本章所定义的数据边界 |
| 进行分析 | 展开分析 |
| 避免把...扩展为普遍结论 | 不能把...当作普适结论 |

## Rewrite Pattern

Before:

```text
这种数据设计能够支持对 A 的评价，但不能被解释为 B。本文仅在 C 条件下讨论 D，不将 E 纳入主线。后续结果应结合 F 进行分析，避免把特定数据集上的结果扩展为普遍结论。
```

After:

```text
数据设计可以评价 A，但是不能解释出 B。本文只在 C 范围内以及 D 输入下讨论性能，并没有把 E 纳入主线。后续结果中出现的表现，需要依照 F 展开分析，不能把某个数据集上取得的结果当作普适结论。
```

## Guardrails

- Keep the limitation boundary intact. Do not make claims broader or narrower than the source.
- Do not remove cautionary statements just to reduce AI traces.
- Do not turn scientific limitations into informal excuses.
