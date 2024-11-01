(import [aiohttp [ClientSession]])
(import asyncio)
(import os)

; Define a macro for awaiting asynchronous calls
(defmacro <- [func &rest args]
  `(await ~func ~@args))

; Define OpenAI API settings
(setv api-key (get (. os environ) "OPENAI_API_KEY"))
(setv api-url "https://api.openai.com/v1/chat/completions")
(setv model "gpt-4o-mini")  ; Retained as per your specification

; Define an asynchronous function to send requests to OpenAI
(defn/a make-request [prompt]
  (with/a [session (ClientSession)]  ; Create an aiohttp session
    (with/a [response (.post session api-url  ; Send POST request
                              :headers {"Authorization" f"Bearer {api-key}"
                                        "Content-Type" "application/json"}
                              :json {"model" model
                                     "messages" [{"role" "user"  "content" f"{prompt}"}]})]
      (setv data (<- (response.json)))  ; Await the JSON response
      (print data))))            ; Print the raw response for debugging

; Run the asynchronous request
(asyncio.run (make-request "what is 2+2?"))

