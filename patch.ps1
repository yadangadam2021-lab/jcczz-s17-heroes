$file = "index.html"
$c = Get-Content $file -Raw -Encoding UTF8

# ── 1. 浅色主题 body 背景 ──────────────────────────────────────────────
$c = $c -replace 'body\{(\r?\n)?  font-family[^}]+\}', "body{`n  font-family:'Microsoft YaHei','PingFang SC',sans-serif;`n  background:#f4f6f9;`n  color:#333;min-height:100vh;`n}"

# ── 2. 去掉 body::before 深色光晕 ────────────────────────────────────
$c = $c -replace '(?s)body::before\{.*?\}', ''

# ── 3. header 背景改为白色 ────────────────────────────────────────────
$c = $c -replace 'header h1\{(\r?\n  [^\}]+)+\}', "header h1{`n  font-size:2em;font-weight:900;color:#1a1a2e;letter-spacing:3px;`n}"

# ── 4. 去掉 h1 shimmer 动画渐变色（已用纯色替换，保留字段安全） ──────

# ── 5. subtitle 颜色改浅色 ───────────────────────────────────────────
$c = $c -replace 'header \.subtitle\{[^}]+\}', "header .subtitle{font-size:.95em;color:#666;margin-top:4px;letter-spacing:2px;}"

# ── 6. season-badge 隐藏 ─────────────────────────────────────────────
$c = $c -replace '\.season-badge\{[^}]+\}', ".season-badge{display:none}"

# ── 7. stats-bar 隐藏 ────────────────────────────────────────────────
$c = $c -replace '\.stats-bar[^{]*\{[^}]+\}', ".stats-bar{display:none}"
$c = $c -replace '\.stats-bar \.stat[^{]*\{[^}]+\}', ''
$c = $c -replace '\.stats-bar \.stat span[^{]*\{[^}]+\}', ''

# ── 8. 搜索框改浅色 ───────────────────────────────────────────────────
$c = $c -replace '\.search-box\{(\r?\n  [^\}]+)+\}', ".search-box{`n  flex:1;min-width:250px;padding:10px 18px;`n  border-radius:20px;border:1px solid #d0d5dd;`n  background:#fff;color:#333;font-size:.95em;`n  outline:none;transition:all .2s;`n  box-shadow:0 1px 4px rgba(0,0,0,.06);`n}"
$c = $c -replace '\.search-box:focus\{[^}]+\}', ".search-box:focus{border-color:#6366f1;box-shadow:0 0 0 3px rgba(99,102,241,.12)}"
$c = $c -replace '\.search-box::placeholder\{[^}]+\}', ".search-box::placeholder{color:#aaa}"

# ── 9. 过滤按钮改浅色 ─────────────────────────────────────────────────
$c = $c -replace '\.filter-btn\{(\r?\n  [^\}]+)+\}', ".filter-btn{`n  padding:5px 14px;border-radius:14px;border:1px solid #d0d5dd;`n  background:#fff;color:#555;font-size:.82em;`n  cursor:pointer;transition:all .2s;white-space:nowrap;`n}"
$c = $c -replace '\.filter-btn:hover,\.filter-btn\.active\{[^}]+\}', ".filter-btn:hover{background:#eef2ff;border-color:#6366f1;color:#6366f1}`n.filter-btn.active{background:#6366f1;border-color:#6366f1;color:#fff;box-shadow:0 2px 8px rgba(99,102,241,.25)}"

# ── 10. cost-header 改白色背景 ───────────────────────────────────────
$c = $c -replace '\.cost-header\{(\r?\n  [^\}]+)+\}', ".cost-header{`n  display:flex;align-items:center;gap:10px;margin-bottom:10px;`n  padding:8px 14px;border-radius:10px;background:#fff;`n  border-left:4px solid #aaa;box-shadow:0 1px 4px rgba(0,0,0,.06);`n}"

# ── 11. hero-card 改白色背景 ──────────────────────────────────────────
$c = $c -replace '\.hero-card\{(\r?\n  [^\}]+)+\}', ".hero-card{`n  background:#fff;border-radius:10px;padding:10px;`n  border:1px solid #e8ecf0;`n  transition:box-shadow .2s,border-color .2s;`n  animation:fadeIn .4s ease-out both;`n  position:relative;overflow:hidden;`n  cursor:default;`n}"
$c = $c -replace '\.hero-card:hover\{(\r?\n  [^\}]+)+\}', ".hero-card:hover{box-shadow:0 4px 16px rgba(0,0,0,.1);border-color:#6366f1;}"

# ── 12. 卡片padding紧凑 - 修改hero-avatar尺寸 ────────────────────────
$c = $c -replace '\.hero-avatar\{(\r?\n  [^\}]+)+\}', ".hero-avatar{`n  width:48px;height:48px;border-radius:8px;flex-shrink:0;`n  overflow:hidden;display:flex;align-items:center;justify-content:center;`n  font-size:1.3em;font-weight:900;color:#fff;`n  border:2px solid #e8ecf0;`n}"

# ── 13. hero-card::before 去掉(无需彩色顶边) ─────────────────────────
$c = $c -replace '\.hero-card::before\{[^}]+\}', ".hero-card::before{display:none}"

# ── 14. synergy-tag 改浅色 ───────────────────────────────────────────
$c = $c -replace '\.synergy-tag\{[^}]+\}', ".synergy-tag{font-size:.7em;padding:1px 6px;border-radius:8px;background:#f0f4f8;color:#555;border:1px solid #e0e7ef;}"

# ── 15. 标题文字修改 ──────────────────────────────────────────────────
$c = $c -replace '<h1>金铲铲之战</h1>', '<h1>金铲铲之战 · 英雄图鉴</h1>'
$c = $c -replace '<div class="subtitle">S17 星神赛季 · 英雄图鉴</div>', '<div class="subtitle">S17 星神赛季</div>'
$c = $c -replace '<div class="season-badge">[^<]+</div>', ''

# ── 16. 去掉stats-bar HTML ───────────────────────────────────────────
$c = $c -replace '(?s)<div class="stats-bar">.*?</div>\r?\n', ''

# ── 17. 搜索 placeholder 修改 ────────────────────────────────────────
$c = $c -replace 'placeholder="🔍 搜索英雄名称、羁绊、定位\.\.\."', 'placeholder="🔍 搜索英雄名、拼音、首字母缩写..."'

# ── 18. 替换搜索JS逻辑（加入拼音/首字母支持） ────────────────────────
$pinyinMap = @'
const PINYIN_MAP = {
  '贝蕾亚':'bei lei ya','波比':'bo bi','维迦':'wei jia','凯特琳':'kai te lin',
  '提莫':'ti mo','内瑟斯':'nei se si','崔斯特':'cui si te','泰隆':'tai long',
  '伊泽瑞尔':'yi ze rui er','蕾欧娜':'lei ou na','丽桑卓':'li sang zhuo',
  '雷克塞':'lei ke sai','卑尔维斯':'bei er wei si','阿卡丽':'a ka li',
  '金克丝':'jin ke si','纳尔':'na er','派克':'pai ke','古拉加斯':'gu la jia si',
  '格温':'ge wen','贾克斯':'jia ke si','米利欧':'mi li ou','佐伊':'zuo yi',
  '小木灵':'xiao mu ling','莫德凯撒':'mo de kai sa','潘森':'pan sen',
  '厄运小姐':'e yun xiao jie','俄洛伊':'e luo yi','阿萝拉':'a luo la',
  '菲兹':'fei zi','茂凯':'mao kai','卡莎':'ka sha','厄加特':'e jia te',
  '维克托':'wei ke tuo','莎弥拉':'sha mi la','奥恩':'ao en','璐璐':'lu lu',
  '黛安娜':'dai an na','拉亚斯特':'la ya si te','拉莫斯':'la mo si',
  '库奇':'ku qi','千珏':'qian jue','卡尔玛':'ka er ma',
  '奥瑞利安·索尔':'ao rui li an suo er','超级机甲':'chao ji ji jia',
  '易':'yi','娜美':'na mei','努努和威朗普':'nu nu he wei lang pu',
  '锐雯':'rui wen','乐芙兰':'le fu lan','霞':'xia','塔姆':'ta mu',
  '巴德':'ba de','菲奥娜':'fei ao na','烬':'jin','布里茨':'bu li ci',
  '娑娜':'suo na','薇古丝':'wei gu si','慎':'shen','劫':'jie',
  '格雷福斯':'ge lei fu si','莫甘娜':'mo gan na'
};
function getPinyin(name){return PINYIN_MAP[name]||'';}
function getInitials(name){const py=getPinyin(name);if(!py)return '';return py.split(' ').map(s=>s[0]).join('');}
function matchHero(h,q){
  if(!q)return true;
  const name=h.name;
  if(name.includes(q))return true;
  const py=getPinyin(name);
  if(py&&py.replace(/ /g,'').includes(q.replace(/ /g,'')))return true;
  if(py&&py.includes(q))return true;
  const initials=getInitials(name).toLowerCase();
  if(initials&&(initials===q.toLowerCase()||initials.startsWith(q.toLowerCase())))return true;
  const extra=(h.synergies.join(' ')+' '+h.role+' '+h.items.join(' ')).toLowerCase();
  if(extra.includes(q))return true;
  return false;
}
'@

$newSearch = @'
// Search with pinyin + initials
const searchInput = document.getElementById('searchInput');
let searchTimer;
searchInput.addEventListener('input', () => {
  clearTimeout(searchTimer);
  searchTimer = setTimeout(() => {
    const q = searchInput.value.trim().toLowerCase();
    document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
    document.querySelector('.filter-btn[data-filter="all"]').classList.add('active');
    if (!q) { renderHeroes(HEROES); return; }
    renderHeroes(HEROES.filter(h => matchHero(h, q)));
  }, 150);
});
'@

# 在 ITEM_STYLES 前插入 PINYIN_MAP
$c = $c -replace '(const ITEM_STYLES)', "$pinyinMap`n`$1"

# 替换旧的搜索逻辑
$c = $c -replace '(?s)// Search\r?\nconst searchInput.*?renderHeroes\(filtered\);\r?\n  \}\);\r?\n\}\);', $newSearch

[System.IO.File]::WriteAllText((Join-Path (Get-Location) $file), $c, [System.Text.UTF8Encoding]::new($false))
Write-Host "ALL DONE"
