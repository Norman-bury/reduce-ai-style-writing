param(
    [Parameter(Mandatory = $true)]
    [string]$FilePath
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $FilePath)) {
    Write-Host "File not found: $FilePath"
    exit 1
}

function From-Base64Utf8 {
    param([string]$Value)
    return [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($Value))
}

function Show-Matches {
    param(
        [string]$Title,
        [string]$Pattern
    )

    Write-Host ""
    Write-Host $Title
    $matches = Select-String -Path $FilePath -Pattern $Pattern -Encoding UTF8
    if ($null -eq $matches) {
        Write-Host "OK"
        return
    }

    foreach ($m in $matches) {
        Write-Host ("{0}:{1}" -f $m.LineNumber, $m.Line.Trim())
    }
}

Write-Host ("Scanning: {0}" -f $FilePath)

$patterns = @(
    @("[1] Method skeleton markers:", "5Z+65LqO5LiK6L+w5YiG5p6QfOS7pS4r5L2c5Li6fOeUqOS6jnzlvJXlhaV86YeH55SofOmAmui/hy4r5a6e546wfOS7pS4r5a6M5oiQfOiAg+Wvn3zljY/lkIzkvZznlKh85YiG5Yir6K+E5Lu3fOWbtOe7lS4r5bGV5byA"),
    @("[2] Literature/background markers:", "5Zu057uVfOW3suacieeglOeptnzmjqjliqguK+aWueWQkeWPkeWxlXzph43opoHot6/nur985Li76KaB57qm5p2ffOivreS5ieWIpOWIq3zkuLrlop7lvLp86KKr5byV5YWl"),
    @("[3] Boundary/limitation markers:", "5Li76KaB5beu5byCfOS4pOS4quWxgumdonzog73lpJ/mlK/mjIEuK+ivhOS7t3zkuI3og73ooqvop6Pph4rkuLp85LiN6IO96K+05piOfOS7heWcqC4r5p2h5Lu25LiLfOW6lOe7k+WQiHzpgb/lhY3mioouK+aJqeWxleS4unzmma7pgY3nu5Porro="),
    @("[4] High-density academic words:", "5pi+6JGXfOmHjeimgXzkvJjlir985o+Q5Y2HfOWinuW8unzooajovr7og73lipt85o+Q5L6bLivot6/lvoR85L6d6LWWfOWFt+aciXzovoPlvLp85Y+v6KGM5oCn"),
    @("[5] Citation-format risks after rewriting:", "77y7fO+8vXzvvIxcZHxbW11cZCtcLVxkK1tdXQ=="),
    @("[6] Intro/motivation markers:", "5q2j5Zyo5LuOLivovazlkJF85peiLivkuZ/lj6/og7185bey5pyJLivmjIflh7p85bey5pyJLivooajmmI586Z2i5ZCRLivpg6jnvbJ86IO95ZCmfOWPr+eUqOaAp3zmj5Dkvpvkuobnm7TmjqXot6/lvoR86L+b5LiA5q2l6K+05piOfOeEtuiAjHzpgJrluLjlhbfmnIl85a+55LqOLivogIzoqIB86Zq+5Lul6KKr5qOA6aqMfOS4jeWPr+W/veeVpXzph43opoHmlrnlkJF86Zq+5Lul5Zue6YG/fOS4jei2s+S7peaUr+aMgXzop4bkuLp86L+b5LiA5q2l5o+Q56S6fOeOsOacieeglOeptuWIhuWIq3zku43kuI3lhYXliIZ857y65bCR57uf5LiA6K6+6K6hfOS4u+imgei0oeeMruWcqOS6jnzlkIzkuIDor4Tku7fpk77mnaE="),
    @("[7] Dataset role markers:", "6YeH55SoLivmlbDmja7pm4Z85om/5ouFLivop5LoibJ85L2c5Li6Livkv53nlZnlnKh855So5LqO6KeC5a+ffOaJv+aLheS4jeWQjOiBjOi0o3zotJ/otKPnu5nlh7p85LiN6IO95re355So5Li6fOS4uuS6humBv+WFjXzmgoTnhLZ86KeG5Li65a6e6aqM6L6T5YWlfOi/m+WFpeaooeWei+WJjXzlhbHkuqvlkIzkuIDlpZd86Iul5p+Q5LiAfOWPquacieWcqC4r5omN5L+d55WZfOWQjue7reavlOi+g+eahOWPr+avlOaApw=="),
    @("[8] Fine-grained intro residual skeletons:", "5oyB57ut5Lqn55Sf572R57uc5rWB6YePfOi/meS6m+a1gemHj+aXouWPjeaYoHzkuZ/lj6/og73mmrTpnLJ85qOA5rWL5ZKM5ZON5bqU5Y+R55Sf55qE5L2N572ufOWGheWtmOW8gOmUgHzlt7Lnu4/kuI3mmK/ljZXnuq/nmoR85pWw5o2u6IO95ZCmfOWMuemFjeWuieWFqOWTjeW6lHzmo4DmtYvmlrnms5XnmoTlj6/nlKjmgKd85bm25LiK5Lyg5Y+C5pWw5pu05pawfOi3qOWfn+WFseS6q+W4puadpeeahHzpgJrluLjlhbfmnInkuI3lkIx85p+Q5Lqb5a6i5oi356uvfOWPpuS4gOS6m+WuouaIt+err+WImXzlrqLmiLfnq6/liIbluIPlt67lvILkvJrpgKDmiJB85aaC5p6c6K+E5Lu35LuN5YGc55WZfOmDqOe9suepuumXtHzmjZXojrfpnZ7nur/mgKd85LiN5Y+v5b+955WlfOW3suaIkOS4uuivpemihuWfn+eahOmHjeimgeaWueWQkXzml6Lmib/mi4UuK+S5n+WPr+iDveWPguS4jnzmlL7lpKfnq6/kvqforqHnrpfljovlipt85Zyo5L+d55WZLivlkIzml7bpgb/lhY0=")
)

foreach ($entry in $patterns) {
    Show-Matches $entry[0] (From-Base64Utf8 $entry[1])
}

Write-Host ""
Write-Host "Done. Review matches manually; this script is only a surface scanner."
