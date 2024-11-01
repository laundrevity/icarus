```
pipenv install
pipenv sync --dev
pipenv shell
hy main.hy
```

expected response:
```
(icarus) bash-3.2$ hy main.hy 
{'id': 'chatcmpl-AOaURvaspzVB8JHEM5AtVp4aO29gb', 'object': 'chat.completion', 'created': 1730423503, 'model': 'gpt-4o-mini-2024-07-18', 'choices': [{'index': 0, 'message': {'role': 'assistant', 'content': '2 + 2 equals 4.', 'refusal': None}, 'logprobs': None, 'finish_reason': 'stop'}], 'usage': {'prompt_tokens': 14, 'completion_tokens': 8, 'total_tokens': 22, 'prompt_tokens_details': {'cached_tokens': 0}, 'completion_tokens_details': {'reasoning_tokens': 0}}, 'system_fingerprint': 'fp_0ba0d124f1'}
```
