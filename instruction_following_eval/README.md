# IFEval: Instruction Following Eval

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
instruction_following_eval. For example:

```bash
# Content of `--input_response_data` should be like:
# {"prompt": "Write a 300+ word summary ...", "response": "PUT YOUR MODEL RESPONSE HERE"}
# {"prompt": "I am planning a trip to ...", "response": "PUT YOUR MODEL RESPONSE HERE"}
# ...
python3 -m instruction_following_eval.evaluation_main \
  --input_data=./instruction_following_eval/data/input_data.jsonl \
  --input_response_data=./instruction_following_eval/data/input_response_data_gpt4_20231107_145030.jsonl \
  --output_dir=./instruction_following_eval/data/
  --mode=0
```
### Note
---
For parameter `mode`:  
`--mode=0`: General (original 25 instructions)  
`--mode=1`: Customer Service (17 Customer Service instructions)  

The Customer Service instructions list is as follows:  
* Keywords: 
  "Include Keywords", 
  "Keyword Frequency", 
  "Forbidden Words"  
* Language: 
  "Response Language"  
* Length Constraints: 
  "Number Paragraphs", 
  "Number Words", 
  "Number Sentences", 
  "Number Paragraphs + First Word in i-th Paragraph"  
* Detectable Content: 
  "Postscript",  
* Detectable Format: 
  "Number Bullets",
  "Multiple Sections",
  "JSON Format",
  "Title"  
* Combination: 
  "Repeat Prompt",
  "Two Responses"  
* Start with / End with: 
  "End Checker"  
* Punctuation:
  "No commas"  

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