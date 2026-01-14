# IFEval: Instruction Following Eval (zh-tw)

This is not an officially supported Google product.

This repository contains source code and data for
[Instruction Following Evaluation for Large Language Models](arxiv.org/abs/2311.07911)

## Dependencies

Please make sure that all required python packages are installed via:

```
pip3 install -r requirements.txt
```

## How to run

You need to create a jsonl file with two entries: prompt and response.
Then, call `evaluation_main` from the parent folder of
instruction_following_eval_zh. For example:

```bash
# Content of `--input_response_data` should be like:
# {"prompt": "Write a 300+ word summary ...", "response": "PUT YOUR MODEL RESPONSE HERE"}
# {"prompt": "I am planning a trip to ...", "response": "PUT YOUR MODEL RESPONSE HERE"}
# ...
python3 -m instruction_following_eval_zh.evaluation_main \
  --input_data=./instruction_following_eval_zh/data/translate_input_data.jsonl \
  --input_response_data=./instruction_following_eval_zh/data/llama4.jsonl \
  --output_dir=./instruction_following_eval_zh/output/llama5
  --mode=0
```
### Note
---
For parameter `mode`:  
`--mode=0`: General (original 25 instructions)  
`--mode=1`: Customer Service (17 Customer Service instructions)  

The Customer Service instructions list is as follows:  
* Keywords  
  * "Include Keywords": 回覆中須包含關鍵字 {關鍵字1}、{關鍵字2}。  
  * "Keyword Frequency": 回覆中，{關鍵字} 應出現 {N} 次。  
  * "Forbidden Words": 回覆中不得包含關鍵字 {禁用關鍵字}。  
* Language  
  * "Response Language": 整個回覆需為指定語言。  
* Length Constraints  
  * "Number Paragraphs": 回覆應包含 {N} 個段落數，以 markdown 符號 *** 分隔。  
  * "Number Words": 回覆至少/指定區間/至多 {N} 字。  
  * "Number Sentences": 回覆至少/指定區間/至多 {N} 句。  
  * "Number Paragraphs + First Word in i-th Paragraph": 規範 {N} 個段落數，第 i 個段落必須以單字 {第一個詞} 開頭。  
* Detectable Content  
  * "Postscript": 回覆後段須包含備註，明確加入以 {P.S. 或 P.P.S.} 開頭的備註。  
* Detectable Format  
  * "Number Bullets": 回覆須包含 {N} 個標記重點，使用 markdown 格式，例如`* 這是一個標記點`。  
  * "Multiple Sections": 回覆須包含 {N} 個部分。每個部分的開頭用 {段落符號} X 標記。  
  * "JSON Format": 整個回覆應為 JSON 格式。  
  * "Title": 回覆包含一個標題，用雙尖括號括起來，例如<<標題>>。  
* Combination  
  * "Repeat Prompt": 回覆開頭首先原封不動地重複 prompt，然後再給出答案。   
  * "Two Responses": 回覆包含兩個版本的答案，以 ****** 分隔。  
* Start with / End with  
  * "End Checker": 回覆最後完整加入 {結束句}。這句話後面不能有任何其他字眼。  
* Punctuation  
  * "No commas": 整個回覆不能使用任何逗號。  

The remaining instructions are listed below:  
* Keywords  
  * "Letter Frequency": 回覆中，字母 {letter} 應該出現 {N} 次。  
* Detectable Content  
  * "Number Placeholder": 回應須包含至少 {N} 個用方括號表示的佔位符，例如 [位址]。  
* Detectable Format  
  * "Choose From": 請選擇以下選項 {Yes}、{No}、{Maybe} 之一作答。  
  * "Minimum Number Highlighted Section": 請使用 markdown 格式標記答案中至少 {N} 個部分，例如`*標記部分*`。  
* Change Cases  
  * "All Uppercase": 回覆必須全部使用英文，且只能使用大寫字母。  
  * "All Lowercase": 回覆必須全部使用英文，且只能使用小寫字母。  
  * "Frequency of All-capital Words": 回覆中，全部大寫的英文單字至少/大約/至多出現 {N} 次。  
* Start with / End with  
  * "Quotation": 用雙引號將整個回覆括起來。  
  
## Reference

If you use our work, please consider citing our preprint:

```
@article{zhou2023instruction,
  title={Instruction-Following Evaluation for Large Language Models},
  author={Zhou, Jeffrey and Lu, Tianjian and Mishra, Swaroop and Brahma, Siddhartha and Basu, Sujoy and Luan, Yi and Zhou, Denny and Hou, Le},
  journal={arXiv preprint arXiv:2311.07911},
  year={2023}
}
```

Filtering the sources of Customer Service instructions:

* [LiveBench: A Challenging, Contamination-Free LLM Benchmark](https://arxiv.org/abs/2406.19314)  

* [Benchmarking Complex Instruction-Following with Multiple Constraints Composition](https://arxiv.org/abs/2407.03978)