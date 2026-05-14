# Replacement Library

This library stores observed high-risk wording and lower-template directions. Do not apply it mechanically. Use it as a set of preferred directions while preserving meaning.

## General High-Risk Terms

| High AI-risk expression | Lower-template direction |
|---|---|
| 显著 | 明显 / 较大 / delete if unsupported |
| 重要 | delete if empty / 主要 |
| 优势 | 优点 / 好处 / 效果 |
| 提升 | 提高 |
| 增强 | 加强 / 提高 |
| 表达能力 | 表达 / 信息 / 能力 |
| 提供路径 | 提供途径 / 提供参考 |
| 围绕 | 有关 / 关于 / 对 |
| 依赖 | 依靠 / 需要 |
| 具有 | 有 / 表现出 |
| 较强 | 较好 / 比较强 |
| 可行性 | 可行的想法 / 可行参考 |

## Function Words and Verbs

| High AI-risk expression | Lower-template direction |
|---|---|
| 指出 | 显示 / 认为 |
| 表明 | 显示 / 发现 / 表明 |
| 进一步说明 | 表明 |
| 进一步提示 | 也表明 |
| 提供了直接路径 | 开辟了一条直接的途径 |
| 持续产生 | 一直有...产生 |
| 反映 | 显示 |
| 暴露 | 显示 / 暴露 |
| 能否 | 是否能 / 是否可以 |
| 匹配 | 满足 |
| 减少 | 降低 |
| 削弱 | 降低 |
| 限制 | 造成影响 |
| 捕获 | 捕捉 |
| 不可忽略 | 不可忽视 |
| 承担 | 负责 / 起着 |
| 放大 | 造成...大幅增加 |
| 视为 | 当作 |
| 覆盖 | 包含 / 涵盖 |
| 保留在 | 被保留到 |
| 观察 | 检验 / 观察 |
| 基于上述分析 | 根据以上分析 |
| 与 | 和 |
| 以...作为 | 用...做 |
| 用于 | 用来 / delete when possible |
| 引入 | 加入 / 加上 |
| 采用 | 用 / 使用 |
| 借助 | 借助 / 用, depending on sentence |
| 通过...实现 | 用...来完成 |
| 完成...适配 | 来适应...任务 |
| 考察 | 研究 / 看 |
| 协同作用 | 配合效果 |
| 评价 | 进行评价 / 看...效果 |
| 避免 | 不能 / 不要 |

## Function-Word and Sentence-Tail Downgrades

These are small changes, but they often matter more than replacing adjectives.

| High AI-risk expression | Lower-template direction |
|---|---|
| 与 | 和 / 以及 |
| 或 | 或者 |
| 则 | 就 / 又 / delete if not needed |
| 而是 | 而是 / 不是...而是... can become 并不是...主要是... |
| 其 | 该 / 这个 / delete if the noun is clear |
| 直接影响 | 都会影响 / 都会影响到 |
| 能否 | 是否能 / 是否可以 |
| 是否仍保持 | 是否还能保持 |
| 所有...条件 | 所有...情况 / 各种...条件 |
| 对于 A 而言 | A 的评价 / 对 A 来说 |
| 难以被... | 很难被... / 无法被... |
| 在...中 | 在...当中 / 在...里, only when natural |
| 发生变化后 | 发生变化之后 |
| 同一...中 | 同一个...中 |
| 其作用被限定为 | 其作用只限于 |
| 而不是...来源 | 不能成为...来源 |
| 主要贡献在于 | 主要贡献是 |

## Common Noun-Phrase Downgrades

| High AI-risk expression | Lower-template direction |
|---|---|
| 可用性 | 可操作性 |
| 直接路径 | 直接的途径 |
| 重要方向 | 研究重点 |
| 部署空间 | 使用范围 |
| 计算、内存和同步代价 | 计算、内存、同步的代价 |
| 原始流量跨域共享带来的风险 | 由于原始流量跨域共享而造成的风险 |
| 客户端分布差异 | 客户端分布的不同 |
| 不同设备类型、正常流量模式和攻击类别覆盖 | 设备种类、正常流量模式以及攻击类别是不一样的 |
| 检测和响应发生的位置 | 检测和响应所处的位置 |
| 检测方法的可用性 | 检测方法的可操作性 |
| 隐私保护协同学习方向 | 隐私保护协同学习方向 / 隐私保护协同学习研究重点 |
| 资源受限节点 | 资源受限节点, keep term but simplify surrounding sentence |
| 部署空间 | 使用范围 |
| 端侧计算压力和通信负担 | 端侧计算压力与通信负担 |
| 外部评价事项 | 外部评价事项 |
| 统一设计 | 统一的设计 |
| 评价链条 | 评价链路 |
| 数据来源角色 | 数据来源的主体 |
| 可比特征接口 | 可比特征接口 / 可比较的特征接口 |
| 预处理管线 | 预处理管道 |
| 两个层面 | 两个方面 / 两种 |
| 多层级特征 | 多层特征 |
| 分割能力 | 分割效果 |
| 泛化表现 | 泛化能力 |
| 适应能力 | 适应性 |
| 参数高效路径 | 参数高效途径 |
| 领域自适应技巧 | 领域自适应技术 |
| 典型挑战 | 常见难题 |
| 普遍结论 | 普适结论 |

## Quality Risks

Avoid these unless the user explicitly wants a rougher draft style:

- `是现实的`
- `限制之内`
- `给...赋予...根基`
- `成了` in very formal thesis passages
- changing citations, such as `[2,5,6]` to `[2-5]`
- adding conditions that were not present in the source
