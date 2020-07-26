<section id="nice" data-tool="mdnice编辑器" data-website="https://www.mdnice.com" style="font-size: 16px; color: black; padding: 0 10px; line-height: 1.6; word-spacing: 0px; letter-spacing: 0px; word-break: break-word; word-wrap: break-word; text-align: left; font-family: Optima-Regular, Optima, PingFangSC-light, PingFangTC-light, 'PingFang SC', Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;"><h2 data-tool="mdnice编辑器" style="margin-top: 30px; margin-bottom: 15px; padding: 0px; font-weight: bold; color: black; border-bottom: 2px solid rgb(239, 112, 96); font-size: 1.3em;"><span class="prefix" style="display: none;"></span><span class="content" style="display: inline-block; font-weight: bold; background: rgb(239, 112, 96); color: #ffffff; padding: 3px 10px 1px; border-top-right-radius: 3px; border-top-left-radius: 3px; margin-right: 3px;">19、字典树（Trie）</span><span class="suffix"></span><span style="display: inline-block; vertical-align: bottom; border-bottom: 36px solid #efebe9; border-right: 20px solid transparent;"> </span></h2>
<ul data-tool="mdnice编辑器" style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: disc;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">数据结构</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">是一种树形结构，即Trie树，又称单词查找树或键树</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">典型应用于统计和排序大量的字符串（但又不限于字符串），经常被搜索引擎系统用于文本词频统计</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">优点：最大限度的减少无谓的字符串比较，查询效率比哈希表高</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">核心思想</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">核心思想是用空间换时间</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">利用字符串的公共前缀来降低查询时间的开销以达到提高效率的目的</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">基本性质</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">1、结点本身不存完整单词</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">2、从根结点到某一结点，路径上经过的字符连接起来，为该结点对应的字符串</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">3、每个结点的所有子结点路径代表的字符都不相同</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">与其他数据结构对比</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">哈希表可以在 O(1) 时间内寻找键值，却无法高效的完成 1、找到具有同一前缀的全部键值 2、按词典序枚举字符串的数据集</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">随着哈希表大小增加，会出现大量的冲突，时间复杂度可能增加到 O(n)，其中 n 是插入的键的数量</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Trie 树在存储多个具有相同前缀的键时可以使用较少的空间。此时 Trie 树只需要 O(m) 的时间复杂度，其中 m 为键长</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">平衡树中查找键值需要 O(mlogn) 时间复杂度</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">代码模版</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Python实现</section></li></ul>
<pre class="custom" style="margin-top: 10px; margin-bottom: 10px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.55) 0px 2px 10px;"><span style="display: block; background: url(https://imgkr.cn-bj.ufileos.com/97e4eed2-a992-4976-acf0-ccb6fb34d308.png); height: 30px; width: 100%; background-size: 40px; background-repeat: no-repeat; background-color: #fff; margin-bottom: -7px; border-radius: 5px; background-position: 10px 10px;"></span><code class="hljs" style="overflow-x: auto; display: block; -webkit-overflow-scrolling: touch; font-size: 14px; word-wrap: break-word; padding: 2px 4px; margin: 0 2px; background-color: rgba(27,31,35,.05); font-family: Operator Mono, Consolas, Monaco, Menlo, monospace; word-break: break-all; color: rgb(239, 112, 96); padding-top: 15px; background: #fff; border-radius: 5px;"><span class="hljs-class" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">class</span> <span class="hljs-title" style="color: #5c2699; line-height: 26px;">Trie</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(object)</span>:</span>
<span/>  
<span/>     <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">def</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">__init__</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(self)</span>:</span> 
<span/>      self.root = {} 
<span/>      self.end_of_word = <span class="hljs-string" style="color: #c41a16; line-height: 26px;">"#"</span> 
<span/>     
<span/>     <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">def</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">insert</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(self, word)</span>:</span> 
<span/>      node = self.root 
<span/>      <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">for</span> char <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">in</span> word: 
<span/>       node = node.setdefault(char, {}) 
<span/>      node[self.end_of_word] = self.end_of_word 
<span/>     
<span/>     <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">def</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">search</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(self, word)</span>:</span> 
<span/>      node = self.root 
<span/>      <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">for</span> char <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">in</span> word: 
<span/>       <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> char <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">not</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">in</span> node: 
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> <span class="hljs-literal" style="color: #aa0d91; line-height: 26px;">False</span> 
<span/>       node = node[char] 
<span/>      <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> self.end_of_word <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">in</span> node 
<span/>     
<span/>     <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">def</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">startsWith</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(self, prefix)</span>:</span> 
<span/>      node = self.root 
<span/>      <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">for</span> char <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">in</span> prefix: 
<span/>       <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> char <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">not</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">in</span> node: 
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> <span class="hljs-literal" style="color: #aa0d91; line-height: 26px;">False</span> 
<span/>       node = node[char] 
<span/>      <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> <span class="hljs-literal" style="color: #aa0d91; line-height: 26px;">True</span>
<span/></code></pre>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">C++ 实现</section></li></ul>
<pre class="custom" style="margin-top: 10px; margin-bottom: 10px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.55) 0px 2px 10px;"><span style="display: block; background: url(https://imgkr.cn-bj.ufileos.com/97e4eed2-a992-4976-acf0-ccb6fb34d308.png); height: 30px; width: 100%; background-size: 40px; background-repeat: no-repeat; background-color: #fff; margin-bottom: -7px; border-radius: 5px; background-position: 10px 10px;"></span><code class="hljs" style="overflow-x: auto; display: block; -webkit-overflow-scrolling: touch; font-size: 14px; word-wrap: break-word; padding: 2px 4px; margin: 0 2px; background-color: rgba(27,31,35,.05); font-family: Operator Mono, Consolas, Monaco, Menlo, monospace; word-break: break-all; color: rgb(239, 112, 96); padding-top: 15px; background: #fff; border-radius: 5px;"><span class="hljs-class" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">class</span> <span class="hljs-title" style="color: #5c2699; line-height: 26px;">Trie</span> {</span>
<span/>    <span class="hljs-class" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">struct</span> <span class="hljs-title" style="color: #5c2699; line-height: 26px;">TrieNode</span> {</span>
<span/>        <span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">map</span>&lt;<span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">char</span>, TrieNode*&gt;child_table;
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> end;
<span/>        TrieNode(): end(<span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>) {}
<span/>    };
<span/>        
<span/>    <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">public</span>:
<span/>    <span class="hljs-comment" style="color: #007400; line-height: 26px;">/** Initialize your data structure here. */</span>
<span/>    Trie() {
<span/>        root = <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">new</span> TrieNode();
<span/>    }
<span/>    
<span/>    <span class="hljs-comment" style="color: #007400; line-height: 26px;">/** Inserts a word into the trie. */</span>
<span/>    <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">void</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">insert</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(<span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">string</span> word)</span> </span>{
<span/>        TrieNode *curr = root;
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">for</span> (<span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> i = <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>; i &lt; word.size(); i++) {
<span/>            <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> (curr-&gt;child_table.count(word[i]) == <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>)
<span/>                curr-&gt;child_table[word[i]] = <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">new</span> TrieNode();
<span/>                
<span/>            curr = curr-&gt;child_table[word[i]];                
<span/>        }
<span/>        curr-&gt;end = <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">1</span>;
<span/>    }
<span/>    
<span/>    <span class="hljs-comment" style="color: #007400; line-height: 26px;">/** Returns if the word is in the trie. */</span>
<span/>    <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">bool</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">search</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(<span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">string</span> word)</span> </span>{
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> find(word, <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">1</span>);
<span/>    }
<span/>    
<span/>    <span class="hljs-comment" style="color: #007400; line-height: 26px;">/** Returns if there is any word in the trie that starts with the given prefix. */</span>
<span/>    <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">bool</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">startsWith</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(<span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">string</span> prefix)</span> </span>{
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> find(prefix, <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>);
<span/>    }
<span/>    <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">private</span>:
<span/>    TrieNode* root;
<span/>    <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">bool</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">find</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(<span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">string</span> s, <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> exact_match)</span> </span>{
<span/>        TrieNode *curr = root;
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">for</span> (<span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> i = <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>; i &lt; s.size(); i++) {
<span/>            <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> (curr-&gt;child_table.count(s[i]) == <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>)
<span/>                <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> <span class="hljs-literal" style="color: #aa0d91; line-height: 26px;">false</span>;
<span/>            <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">else</span>
<span/>                curr = curr-&gt;child_table[s[i]];
<span/>        }
<span/>        
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> (exact_match)
<span/>            <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> (curr-&gt;end) ? <span class="hljs-literal" style="color: #aa0d91; line-height: 26px;">true</span> : <span class="hljs-literal" style="color: #aa0d91; line-height: 26px;">false</span>;
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">else</span>
<span/>            <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> <span class="hljs-literal" style="color: #aa0d91; line-height: 26px;">true</span>;
<span/>    }
<span/>}
<span/></code></pre>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Java 实现</section></li></ul>
<pre class="custom" style="margin-top: 10px; margin-bottom: 10px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.55) 0px 2px 10px;"><span style="display: block; background: url(https://imgkr.cn-bj.ufileos.com/97e4eed2-a992-4976-acf0-ccb6fb34d308.png); height: 30px; width: 100%; background-size: 40px; background-repeat: no-repeat; background-color: #fff; margin-bottom: -7px; border-radius: 5px; background-position: 10px 10px;"></span><code class="hljs" style="overflow-x: auto; display: block; -webkit-overflow-scrolling: touch; font-size: 14px; word-wrap: break-word; padding: 2px 4px; margin: 0 2px; background-color: rgba(27,31,35,.05); font-family: Operator Mono, Consolas, Monaco, Menlo, monospace; word-break: break-all; color: rgb(239, 112, 96); padding-top: 15px; background: #fff; border-radius: 5px;"><span class="hljs-class" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">class</span> <span class="hljs-title" style="color: #5c2699; line-height: 26px;">Trie</span> </span>{
<span/>    <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">private</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">boolean</span> isEnd;
<span/>    <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">private</span> Trie[] next;
<span/>    <span class="hljs-comment" style="color: #007400; line-height: 26px;">/** Initialize your data structure here. */</span>
<span/>    <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">public</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">Trie</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">()</span> </span>{
<span/>        isEnd = <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">false</span>;
<span/>        next = <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">new</span> Trie[<span class="hljs-number" style="color: #1c00cf; line-height: 26px;">26</span>];
<span/>    }
<span/>    
<span/>    <span class="hljs-comment" style="color: #007400; line-height: 26px;">/** Inserts a word into the trie. */</span>
<span/>    <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">public</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">void</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">insert</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(String word)</span> </span>{
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> (word == <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">null</span> || word.length() == <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>) <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span>;
<span/>        Trie curr = <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">this</span>;
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">char</span>[] words = word.toCharArray();
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">for</span> (<span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> i = <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>;i &lt; words.length;i++) {
<span/>            <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> n = words[i] - <span class="hljs-string" style="color: #c41a16; line-height: 26px;">'a'</span>;
<span/>            <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> (curr.next[n] == <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">null</span>) curr.next[n] = <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">new</span> Trie();
<span/>            curr = curr.next[n];
<span/>        }
<span/>        curr.isEnd = <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">true</span>;
<span/>    }
<span/>    
<span/>    <span class="hljs-comment" style="color: #007400; line-height: 26px;">/** Returns if the word is in the trie. */</span>
<span/>    <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">public</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">boolean</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">search</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(String word)</span> </span>{
<span/>        Trie node = searchPrefix(word);
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> node != <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">null</span> &amp;&amp; node.isEnd;
<span/>    }
<span/>    
<span/>    <span class="hljs-comment" style="color: #007400; line-height: 26px;">/** Returns if there is any word in the trie that starts with the given prefix. */</span>
<span/>    <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">public</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">boolean</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">startsWith</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(String prefix)</span> </span>{
<span/>        Trie node = searchPrefix(prefix);
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> node != <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">null</span>;
<span/>    }
<span/>
<span/>    <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">private</span> Trie <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">searchPrefix</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(String word)</span> </span>{
<span/>        Trie node = <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">this</span>;
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">char</span>[] words = word.toCharArray();
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">for</span> (<span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> i = <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>;i &lt; words.length;i++) {
<span/>            node = node.next[words[i] - <span class="hljs-string" style="color: #c41a16; line-height: 26px;">'a'</span>];
<span/>            <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> (node == <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">null</span>) <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">null</span>;
<span/>        }
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> node;
<span/>    }
<span/>}
<span/></code></pre>
</section></li></ul>
<h2 data-tool="mdnice编辑器" style="margin-top: 30px; margin-bottom: 15px; padding: 0px; font-weight: bold; color: black; border-bottom: 2px solid rgb(239, 112, 96); font-size: 1.3em;"><span class="prefix" style="display: none;"></span><span class="content" style="display: inline-block; font-weight: bold; background: rgb(239, 112, 96); color: #ffffff; padding: 3px 10px 1px; border-top-right-radius: 3px; border-top-left-radius: 3px; margin-right: 3px;">20、并查集 （Disjoint Set）</span><span class="suffix"></span><span style="display: inline-block; vertical-align: bottom; border-bottom: 36px solid #efebe9; border-right: 20px solid transparent;"> </span></h2>
<ul data-tool="mdnice编辑器" style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: disc;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">适用场景</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">组团、配对问题</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">基本操作</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">makeSet(s): 建立一个新的并查集，其中包含s个单元素集合</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">unionSet(x, y): 把元素x和元素y所在的集合合并，要求x和y所在的集合不相交， 如果相交则不合并</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">find(x): 找到元素x所在的集合的代表，该操作也可以用于判断两个元素是否位于同一个集合，只要将他们各自的代表比较一下即可</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">原理</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">1、初始化：每个元素初始化一个parent数组指向自己</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">2、合并：找到各自集合的领头元素（parent==自己），然后将其中一个的集合的parent指向另一个集合的领头元素</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">3、查询：找到集合的领头元素（parent==自己）</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">代码实现</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Swift 实现</section></li></ul>
<pre class="custom" style="margin-top: 10px; margin-bottom: 10px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.55) 0px 2px 10px;"><span style="display: block; background: url(https://imgkr.cn-bj.ufileos.com/97e4eed2-a992-4976-acf0-ccb6fb34d308.png); height: 30px; width: 100%; background-size: 40px; background-repeat: no-repeat; background-color: #fff; margin-bottom: -7px; border-radius: 5px; background-position: 10px 10px;"></span><code class="hljs" style="overflow-x: auto; display: block; -webkit-overflow-scrolling: touch; font-size: 14px; word-wrap: break-word; padding: 2px 4px; margin: 0 2px; background-color: rgba(27,31,35,.05); font-family: Operator Mono, Consolas, Monaco, Menlo, monospace; word-break: break-all; color: rgb(239, 112, 96); padding-top: 15px; background: #fff; border-radius: 5px;"><span class="hljs-class" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">class</span> <span class="hljs-title" style="color: #5c2699; line-height: 26px;">UnionFind</span> </span>{
<span/>    <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">var</span> <span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">count</span> = <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>
<span/>    <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">var</span> p: [<span class="hljs-type" style="color: #5c2699; line-height: 26px;">Int</span>]
<span/>    <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">var</span> size: [<span class="hljs-type" style="color: #5c2699; line-height: 26px;">Int</span>]
<span/>    <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">init</span>(<span class="hljs-number" style="color: #1c00cf; line-height: 26px;">_</span> <span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">count</span>: <span class="hljs-type" style="color: #5c2699; line-height: 26px;">Int</span>){
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">self</span>.<span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">count</span> = <span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">count</span>
<span/>        p = [<span class="hljs-type" style="color: #5c2699; line-height: 26px;">Int</span>](repeating: <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>, <span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">count</span>: <span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">count</span>)
<span/>        size = [<span class="hljs-type" style="color: #5c2699; line-height: 26px;">Int</span>](repeating: <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">1</span>, <span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">count</span>: <span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">count</span>)
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">for</span> i <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">in</span> <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>..&lt;<span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">count</span> { p[i] = i }
<span/>    }
<span/>
<span/>    <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">func</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">find</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(<span class="hljs-number" style="color: #1c00cf; line-height: 26px;">_</span> i: Int)</span></span> -&gt; <span class="hljs-type" style="color: #5c2699; line-height: 26px;">Int</span> {
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">var</span> i = i 
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">while</span> i != p[i] {
<span/>            p[i] = p[p[i]]
<span/>            i = p[i]
<span/>        }
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> i
<span/>    }
<span/>    <span class="hljs-comment" style="color: #007400; line-height: 26px;">/// O(1)</span>
<span/>    <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">func</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">find1</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(<span class="hljs-number" style="color: #1c00cf; line-height: 26px;">_</span> i: Int)</span></span> -&gt; <span class="hljs-type" style="color: #5c2699; line-height: 26px;">Int</span> {<span class="hljs-comment" style="color: #007400; line-height: 26px;">// 路径压缩</span>
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">var</span> root = i ,i = i
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">while</span> p[root] != root { root = p[root] }
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">while</span> p[i] != i {
<span/>            <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">let</span> x = i
<span/>            i = p[i]
<span/>            p[x] = root
<span/>        }
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> root
<span/>    }
<span/>    <span class="hljs-comment" style="color: #007400; line-height: 26px;">/// O(n) or O(logn)</span>
<span/>    <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">func</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">union</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(<span class="hljs-number" style="color: #1c00cf; line-height: 26px;">_</span> i: Int, <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">_</span> j: Int)</span></span> {
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">let</span> pi = <span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">find</span>(i), pj = <span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">find</span>(j)
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> pi == pj { <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> }
<span/>        <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> size[pi] &lt; size[pj] {
<span/>            p[pi] = pj
<span/>            size[pj] += size[pi]
<span/>        }<span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">else</span> {
<span/>            p[pj] = pi
<span/>            size[pi] += size[pj]
<span/>        }
<span/>        <span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">count</span> -= <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">1</span>
<span/>    }
<span/>}
<span/></code></pre>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Java 实现</section></li></ul>
<pre class="custom" style="margin-top: 10px; margin-bottom: 10px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.55) 0px 2px 10px;"><span style="display: block; background: url(https://imgkr.cn-bj.ufileos.com/97e4eed2-a992-4976-acf0-ccb6fb34d308.png); height: 30px; width: 100%; background-size: 40px; background-repeat: no-repeat; background-color: #fff; margin-bottom: -7px; border-radius: 5px; background-position: 10px 10px;"></span><code class="hljs" style="overflow-x: auto; display: block; -webkit-overflow-scrolling: touch; font-size: 14px; word-wrap: break-word; padding: 2px 4px; margin: 0 2px; background-color: rgba(27,31,35,.05); font-family: Operator Mono, Consolas, Monaco, Menlo, monospace; word-break: break-all; color: rgb(239, 112, 96); padding-top: 15px; background: #fff; border-radius: 5px;"><span class="hljs-class" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">class</span> <span class="hljs-title" style="color: #5c2699; line-height: 26px;">UnionFind</span> </span>{ 
<span/> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">private</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> count = <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>; 
<span/> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">private</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span>[] parent; 
<span/> <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">public</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">UnionFind</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(<span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> n)</span> </span>{ 
<span/>  count = n; 
<span/>  parent = <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">new</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span>[n]; 
<span/>  <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">for</span> (<span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> i = <span class="hljs-number" style="color: #1c00cf; line-height: 26px;">0</span>; i &lt; n; i++) { 
<span/>   parent[i] = i;
<span/>  }
<span/> } 
<span/> <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">public</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">find</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(<span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> p)</span> </span>{ 
<span/>  <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">while</span> (p != parent[p]) { 
<span/>   parent[p] = parent[parent[p]]; 
<span/>   p = parent[p]; 
<span/>  }
<span/>  <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> p; 
<span/> }
<span/> <span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">public</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">void</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">union</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(<span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> p, <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> q)</span> </span>{ 
<span/>  <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> rootP = find(p); 
<span/>  <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">int</span> rootQ = find(q); 
<span/>  <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> (rootP == rootQ) <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span>; 
<span/>  parent[rootP] = rootQ; 
<span/>  count--;
<span/> }
<span/>}
<span/></code></pre>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Python 实现</section></li></ul>
<pre class="custom" style="margin-top: 10px; margin-bottom: 10px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.55) 0px 2px 10px;"><span style="display: block; background: url(https://imgkr.cn-bj.ufileos.com/97e4eed2-a992-4976-acf0-ccb6fb34d308.png); height: 30px; width: 100%; background-size: 40px; background-repeat: no-repeat; background-color: #fff; margin-bottom: -7px; border-radius: 5px; background-position: 10px 10px;"></span><code class="hljs" style="overflow-x: auto; display: block; -webkit-overflow-scrolling: touch; font-size: 14px; word-wrap: break-word; padding: 2px 4px; margin: 0 2px; background-color: rgba(27,31,35,.05); font-family: Operator Mono, Consolas, Monaco, Menlo, monospace; word-break: break-all; color: rgb(239, 112, 96); padding-top: 15px; background: #fff; border-radius: 5px;"><span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">def</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">init</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(p)</span>:</span> 
<span/> <span class="hljs-comment" style="color: #007400; line-height: 26px;"># for i = 0 .. n: p[i] = i; </span>
<span/> p = [i <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">for</span> i <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">in</span> range(n)] 
<span/> 
<span/><span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">def</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">union</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(self, p, i, j)</span>:</span> 
<span/> p1 = self.parent(p, i) 
<span/> p2 = self.parent(p, j) 
<span/> p[p1] = p2 
<span/> 
<span/><span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">def</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">parent</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(self, p, i)</span>:</span> 
<span/> root = i 
<span/> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">while</span> p[root] != root: 
<span/>  root = p[root] 
<span/> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">while</span> p[i] != i: <span class="hljs-comment" style="color: #007400; line-height: 26px;"># 路径压缩 ?</span>
<span/>  x = i; i = p[i]; p[x] = root 
<span/> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">return</span> root
<span/></code></pre>
</section></li></ul>
<h2 data-tool="mdnice编辑器" style="margin-top: 30px; margin-bottom: 15px; padding: 0px; font-weight: bold; color: black; border-bottom: 2px solid rgb(239, 112, 96); font-size: 1.3em;"><span class="prefix" style="display: none;"></span><span class="content" style="display: inline-block; font-weight: bold; background: rgb(239, 112, 96); color: #ffffff; padding: 3px 10px 1px; border-top-right-radius: 3px; border-top-left-radius: 3px; margin-right: 3px;">21、高级搜索（High-Level Search）</span><span class="suffix"></span><span style="display: inline-block; vertical-align: bottom; border-bottom: 36px solid #efebe9; border-right: 20px solid transparent;"> </span></h2>
<ul data-tool="mdnice编辑器" style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: disc;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;"><strong style="font-weight: bold; color: black;">剪枝</strong></p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">优化掉重复的，或次优的分支</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;"><strong style="font-weight: bold; color: black;">双向BFS（Two-Ended BFS）</strong></p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">特性</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">左右相向扩散</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">循环条件是两个queue同时判断（两个set）</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">每次从小的set扩散</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">代码模版</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Swift 实现</section></li></ul>
<pre class="custom" style="margin-top: 10px; margin-bottom: 10px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.55) 0px 2px 10px;"><span style="display: block; background: url(https://imgkr.cn-bj.ufileos.com/97e4eed2-a992-4976-acf0-ccb6fb34d308.png); height: 30px; width: 100%; background-size: 40px; background-repeat: no-repeat; background-color: #fff; margin-bottom: -7px; border-radius: 5px; background-position: 10px 10px;"></span><code class="hljs" style="overflow-x: auto; display: block; -webkit-overflow-scrolling: touch; font-size: 14px; word-wrap: break-word; padding: 2px 4px; margin: 0 2px; background-color: rgba(27,31,35,.05); font-family: Operator Mono, Consolas, Monaco, Menlo, monospace; word-break: break-all; color: rgb(239, 112, 96); padding-top: 15px; background: #fff; border-radius: 5px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">var</span> beginSet = <span class="hljs-type" style="color: #5c2699; line-height: 26px;">Set</span>&lt;<span class="hljs-type" style="color: #5c2699; line-height: 26px;">String</span>&gt;()
<span/><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">var</span> endSet = <span class="hljs-type" style="color: #5c2699; line-height: 26px;">Set</span>&lt;<span class="hljs-type" style="color: #5c2699; line-height: 26px;">String</span>&gt;()
<span/><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">var</span> visited = <span class="hljs-type" style="color: #5c2699; line-height: 26px;">Set</span>&lt;<span class="hljs-type" style="color: #5c2699; line-height: 26px;">String</span>&gt;()
<span/>
<span/>beginSet.update(with: begin)
<span/>endSet.update(with: end)
<span/>
<span/><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">while</span> !beginSet.isEmpty, !endSet.isEmpty {
<span/>    <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> beginSet.<span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">count</span> &gt; endSet.<span class="hljs-built_in" style="color: #5c2699; line-height: 26px;">count</span>  { 
<span/>        (beginSet, endSet) = (endSet, beginSet)
<span/>        <span class="hljs-comment" style="color: #007400; line-height: 26px;">//swap(&amp;beginSet, &amp;endSet)</span>
<span/>    }
<span/>    
<span/>    <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">var</span> nextSet = <span class="hljs-type" style="color: #5c2699; line-height: 26px;">Set</span>&lt;<span class="hljs-type" style="color: #5c2699; line-height: 26px;">String</span>&gt;()
<span/>    
<span/>    process(beginSet, nextSet, visited)
<span/>    
<span/>    beginSet = nextSet
<span/>}
<span/></code></pre>
</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;"><em style="font-style: italic; color: black;"><em style="font-style: italic; color: black;">启发式搜索（A</em>）（Heuristic Search）</em>*</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">估价函数(启发式函数) -&gt; h(n)</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">用来评价哪些结点是我们最有希望寻找的结点</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">会返回一个非负实数</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">也可以认为是从 结点n 到 目标结点 路径的估计成本</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">特性</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">是一种告知搜索方向的方法</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">提供了一种明智的方法来猜测那个邻居结点会导向一个目标</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">代码模版</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Python 实现</section></li></ul>
<pre class="custom" style="margin-top: 10px; margin-bottom: 10px; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.55) 0px 2px 10px;"><span style="display: block; background: url(https://imgkr.cn-bj.ufileos.com/97e4eed2-a992-4976-acf0-ccb6fb34d308.png); height: 30px; width: 100%; background-size: 40px; background-repeat: no-repeat; background-color: #fff; margin-bottom: -7px; border-radius: 5px; background-position: 10px 10px;"></span><code class="hljs" style="overflow-x: auto; display: block; -webkit-overflow-scrolling: touch; font-size: 14px; word-wrap: break-word; padding: 2px 4px; margin: 0 2px; background-color: rgba(27,31,35,.05); font-family: Operator Mono, Consolas, Monaco, Menlo, monospace; word-break: break-all; color: rgb(239, 112, 96); padding-top: 15px; background: #fff; border-radius: 5px;"><span class="hljs-function" style="line-height: 26px;"><span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">def</span> <span class="hljs-title" style="color: #1c00cf; line-height: 26px;">AstarSearch</span><span class="hljs-params" style="color: #5c2699; line-height: 26px;">(graph, start, end)</span>:</span>
<span/> pq = collections.priority_queue() <span class="hljs-comment" style="color: #007400; line-height: 26px;"># 优先级 —&gt; 估价函数</span>
<span/> pq.append([start]) 
<span/> visited.add(start)
<span/> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">while</span> pq: 
<span/>  node = pq.pop() <span class="hljs-comment" style="color: #007400; line-height: 26px;"># can we add more intelligence here ?</span>
<span/>  visited.add(node)
<span/>  process(node) 
<span/>  nodes = generate_related_nodes(node) 
<span/>   unvisited = [node <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">for</span> node <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">in</span> nodes <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">if</span> node <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">not</span> <span class="hljs-keyword" style="color: #aa0d91; line-height: 26px;">in</span> visited]
<span/>  pq.push(unvisited)
<span/></code></pre>
</section></li></ul>
</section></li></ul>
<h2 data-tool="mdnice编辑器" style="margin-top: 30px; margin-bottom: 15px; padding: 0px; font-weight: bold; color: black; border-bottom: 2px solid rgb(239, 112, 96); font-size: 1.3em;"><span class="prefix" style="display: none;"></span><span class="content" style="display: inline-block; font-weight: bold; background: rgb(239, 112, 96); color: #ffffff; padding: 3px 10px 1px; border-top-right-radius: 3px; border-top-left-radius: 3px; margin-right: 3px;">22、平衡二叉树 （Self-balancing Binary Search Tree）</span><span class="suffix"></span><span style="display: inline-block; vertical-align: bottom; border-bottom: 36px solid #efebe9; border-right: 20px solid transparent;"> </span></h2>
<ul data-tool="mdnice编辑器" style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: disc;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">前置场景</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">1、保证二维维度 -&gt; 左右子树结点平衡（recursively）</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">2、balance</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">具体实现</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">2-3 Tree</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">AVL Tree</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">B- Tree （B树）</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Red-black Tree （红黑树）</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Splay Tree （伸展树）</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Treap （树堆）</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;"><strong style="font-weight: bold; color: black;">平衡二叉搜索树 之 AVL树</strong></p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">1、发明者 G.M.Adelson-Velsky 和 Evgenii Landis</p>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">2、balance Factor （平衡因子）</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">每个结点的平衡因子都是 {-1, 0, 1}</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">左子树的高度 减去 右子树的高度（有时相反）</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">由来：查询的时间复杂度是树的深度</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">3、通过旋转操作进行平衡</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">1)、基础旋转</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">左旋： 子树形态 -&gt; 右右子树</p>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">右旋： 子树形态 -&gt; 左左子树</p>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">左右旋：子树形态 -&gt; 左右子树</p>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">右左旋：子树形态 -&gt; 右左子树</p>
</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">2)、带有子树的旋转</p>
</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;">4、不足</p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">结点需要存储额外信息</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">调整次数频繁</section></li></ul>
</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;"><strong style="font-weight: bold; color: black;">近似平衡二叉搜索树 之 红黑树</strong></p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">1、是一种近似平衡二叉搜索树</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">2、它能确保任何一个结点的左右子树的<strong style="font-weight: bold; color: black;">高度差小于两倍</strong></section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">3、特性 -&gt; 满足如下特性的二叉搜索树
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">1）、每个结点要么是红色，要么是黑色</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">2）、根结点是黑色</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">3）、每个叶结点（NIL结点，空结点）是黑色</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">4）、不能有相邻接的两个红色结点</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">5）、从任一结点到其每个叶子所有路径都包含相同数目的黑色结点</section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">4、时间复杂度： logn</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">5、关键性质：<strong style="font-weight: bold; color: black;">从根到叶子的最长的可能路径不多于最短的可能路径的两倍长</strong></section></li></ul>
</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;"><p style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black;"><strong style="font-weight: bold; color: black;">AVL树和红黑树对比</strong></p>
<ul style="margin-top: 8px; margin-bottom: 8px; padding-left: 25px; color: black; list-style-type: square;">
<li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">AVL trees provide <strong style="font-weight: bold; color: black;">faster lookups</strong> than Red Black Trees because they are <strong style="font-weight: bold; color: black;">more strictly balanced</strong>.(AVL 比 红黑树 查询快， 因为AVL是更加严格平衡的)</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Red Black Trees provide <strong style="font-weight: bold; color: black;">faster insertion and removal</strong> operations than AVL trees as fewer rotations are done due to relatively relaxed balancing.(红黑树 比 AVL 插入和删除快， 因为红黑树旋转操作少一点，AVL旋转操作多一点)</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">AVL trees store balance <strong style="font-weight: bold; color: black;">factors or heights</strong> with each node, thus requires storage for an integer per node whereas Red Black Trees requires only 1 bit of information per node.（AVL 需要额外的内存存储factor和height， 红黑树只需要1个bit存储0或者1来表示红或者黑）</section></li><li><section style="margin-top: 5px; margin-bottom: 5px; line-height: 26px; text-align: left; color: rgb(1,1,1); font-weight: 500;">Red Black Trees are used in most of the <strong style="font-weight: bold; color: black;">language libraries like map, multimap, multisetin C++</strong> whereas AVL trees are used in <strong style="font-weight: bold; color: black;">databases</strong> where faster retrievals are required. （红黑树一般用在高级语言的库里面，AVL一般用在DB多,因为查询多）</section></li></ul>
</section></li></ul>
<p id="nice-suffix-juejin-container" class="nice-suffix-juejin-container" data-tool="mdnice编辑器" style="font-size: 16px; padding-top: 8px; padding-bottom: 8px; margin: 0; line-height: 26px; color: black; margin-top: 20px !important;">本文使用 <a href="https://mdnice.com/?from=juejin" style="text-decoration: none; word-wrap: break-word; font-weight: bold; color: rgb(239, 112, 96); border-bottom: 1px solid rgb(239, 112, 96);">mdnice</a> 排版</p></section>