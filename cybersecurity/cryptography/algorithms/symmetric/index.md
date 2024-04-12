# Symmetric algorithms

[![encryptioncrypto101](../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)

<div class="row row-cols-lg-2"><div>

Symmetric algorithms <small>(a.k.a. secret key algorithm)</small> are algorithms in which the **same key** is used to encrypt and decrypt a cipher.

🔑 The key length must be at least 128 bits to be acceptable. The longer the key, the more secure the encryption.
</div><div>

**Encryption**: we generate a cipher (`c`) from a message (`m`) using a key (`k`) and an algorithm `C` giving us: `c = C(k, m)`

**Decryption**: we generate back the message (`m`) from the cipher (`c`) and the same key (`k`) using an algorithm `D` giving us: `m = D(k, c)`

➡️ They are usually faster, with a smaller key, and easier to set up.
</div></div>

<hr class="sep-both">

## Two types of algorithms 👪

<div class="row row-cols-lg-2"><div>

#### Stream cipher (<code>chiffrement par flot</code>)

These algorithms encrypt the message bit by bit/byte by byte. They produce a continuous stream of encrypted data which is combined (XORed) with the plaintext to produce the ciphertext.

👉 Examples: One Time Pad, RC4...

</div><div>

#### Block cipher (<code>chiffrement par bloc</code>)

These algorithms split the message into blocks of fixed size `n`. If a block is not "full", some **padding** is added. Each block is encrypted using an algorithm, generating a block of the final ciphertext. Each key has the same length `n` as the block.

👉 Examples: ECB, AES...

➡️ Since the key, the block, and the cipher all have the same length, the output `c` can be viewed as a permutation of `m`.

➡️ `n` is usually 128 bits.
</div></div>

<hr class="sep-both">

## Caesar cipher (<code>Code de César</code>)

[![monoalphabetic_substitution_caesar](../../../_badges/rootme/cryptanalysis/monoalphabetic_substitution_caesar.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Monoalphabetic-substitution-Caesar)
[![ctfcollectionvol1](../../../_badges/thm-p/ctfcollectionvol1.svg)](https://tryhackme.com/room/ctfcollectionvol1)

<div class="row row-cols-lg-2"><div>

Caesar 👑 was replacing letters such as: $a \to d,\ b \to e,\ ...,\ z \to c$. We shift each letter by amount which is the key ($k=3$ here).

It's also a rotation cipher (rot). As $k=13$, it is called rot13.

**Encryption**: shift each letter $k$ times

**Decryption**: apply the reverse operation 🔄️
</div><div>

* **Possible values for k** 🦄: 26
* **Attacks** 🧨
  * Brute force attack
  * Frequency analysis
* **Try it online** 🌍: [Caesar cipher online (cryptii.com)](https://cryptii.com/pipes/caesar-cipher)
* **Still used?** 🟥: no
</div></div>

<hr class="sep-both">

## Substitution cipher (<code>Chiffrement par substitution</code>)

<div class="row row-cols-lg-2"><div>

Similar to Caesar's cipher. Each letter is associated with another: $a \to w,\ b \to e,\ etc.$ The key is a dictionary of 26 letters (a-z).

**Encryption**: use the key to replace each letter

**Decryption**: apply the reverse operation 🔄️
</div><div>

* **Possible values for k** 🦄: $26! ≈ 2^{88.4}$
* **Attacks** 🧨
  * Frequency analysis
  * Cribbing attack
* **Try it online** 🌍: [Substitution cipher (dcode.fr)](https://www.dcode.fr/substitution-cipher)
* **Still used?** 🟥: no
</div></div>

<hr class="sep-both">

## Vigenère cipher (<code>Cryptage en bloc de Vigenère</code>)

[![ctfcollectionvol1](../../../_badges/thm-p/ctfcollectionvol1.svg)](https://tryhackme.com/room/ctfcollectionvol1)
[![polyalphabetic_substitution_vigenère](../../../_badges/rootme/cryptanalysis/polyalphabetic_substitution_vigenère.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Polyalphabetic-substitution-Vigenere)

<div class="row row-cols-lg-2"><div>

This is a Caesar cipher but split into blocs. The goal was to prevent frequency analysis because the same letter will *most likely* be enciphered as different ciphertext letters.

<details class="details-n">
<summary>Example of encryption/decryption</summary>

* message ✉️: `memorize`
* key 🔑: `vgn`
* **ciphertext**: `memorize+vgnvgnv=hkzjxvuk`
    * $M=12$, $V=21$, $12+21=33\equiv 7\ (mod\ 26)=H$
    * $E=4$, $G=6$, $4+6=10\equiv 10\ (mod\ 26)=K$
    * $M=12$, $N=13$, $12+13=25\equiv 25\ (mod\ 26)=Z$
    * ...
* **decrypt**: `hkzjxvuk+vgnvgnv=memorize`
    * $H=7$, $V=21$, $7 - 21 + 26 \equiv 12\ (mod\ 26)=M$
    * $K=10$, $G=6$, $10 - 6 + 26 \equiv 4\ (mod\ 26)=E$
    * $Z=25$, $N=13$, $25 - 13 + 26 \equiv 12\ (mod\ 26)=M$
    * $J=9$, $V=21$, $9 - 21 + 26 \equiv 14\ (mod\ 26)=O$
    * ...
</details>
</div><div>

* **Possible values for k** 🦄: variable
* **Attacks** 🧨
  * Kasiski examination
  * Friedman test
* **Try it online** 🌍: [Vigenère cipher (cryptii.com)](https://cryptii.com/pipes/vigenere-cipher)
* **Still used?** 🟨: yes, but in niche applications
</div></div>

<hr class="sep-both">

## One Time Pad (`Masque jetable`)

[![ctfcollectionvol1](../../../_badges/thm-p/ctfcollectionvol1.svg)](https://tryhackme.com/room/ctfcollectionvol1)

<div class="row row-cols-lg-2"><div>

The **One Time Pad**, or One Time password, abbreviated as **OTP**, is theoretically unbreakable if used correctly. It's not quite used because the key must be as long as the message.

* $C = m \oplus k$
* $D = c \oplus k$

Since both $m$ and $k$ are letters, we need to convert them to binary to use the $\oplus$ (XOR, `ou exclusif`) operator using ASCII encoding <small>(a=77)</small>.
</div><div class="align-self-center">

* **Possible values for k** 🦄: random, unique, and as long as $m$
* **Attacks** 🧨
  * Known plaintext attack
  * Key reuse/two-time pad
* **Try it online** 🌍: [One Time Pad (boxentriq.com)](https://www.boxentriq.com/code-breaking/one-time-pad)
* **Still used?** 🟨: yes, but in niche applications
</div></div>

<hr class="sep-both">

## Advanced Encryption Standard (AES)

[![introductiontonetworking](../../../_badges/htb/introductiontonetworking.svg)](https://academy.hackthebox.com/course/preview/introduction-to-networking)
[![docker_layers](../../../_badges/rootme/forensic/docker_layers.svg)](https://www.root-me.org/en/Challenges/Forensic/Docker-layers)

<div class="row row-cols-lg-2"><div>

The **Advanced Encryption Standard**, abbreviated as **AES**, is a part of the **Block ciphers** algorithms. It's quite used and recognized as both fast and secure. It was designed by the NIST.

Each chunk has the size of the key, e.g., 128 bits for AES-128 <small>(16 bytes)</small>. Padding is added to if needed according to the padding scheme.

<details class="details-n">
<summary>AES-ECB (Electronic Code Book)</summary>

Using this mode, each block is encrypted using the same key. It means that we would have identical cipher chunks if some plaintext chunks are identical.

* **Attacks** 🧨
  * Brute force attack
  * Known plaintext attack
  * Dictionary attack
* **Still used?** 🟨: yes, in some applications, mostly for integrity rather than confidentiality.
</details>

<details class="details-n">
<summary>AES-CBC (Cipher Block Chaining)</summary>

Using this mode with AES, we introduce a new parameter IV <small>(unique and not inferable)</small> to encrypt the first block. Then, we use the generated cipher of the previous block to encrypt the next block...

* **Attacks** 🧨
  * Padding oracle attack
  * Bit-flipping attack
* **Still used?** 🟩: yes, it's widely used, but there are better
</details>
</div><div>

* **Possible values for k** 🦄: a string of 128/192/256 bits
* **Padding schemes** 📚: `b'\xN' * N` missing bytes | `\x01\x02` etc. 
* **Attacks** 🧨
  * Brute force attack
  * Known plaintext attack
  * Side-channel/timing attacks
* **Try it online** 🌍: [One Time Pad (boxentriq.com)](https://www.boxentriq.com/code-breaking/one-time-pad)
* **Still used?** 🟩: yes, it's widely used <small>(AES-GCM/AES-CCM/...)</small>
</div></div>

<hr class="sep-both">

## AES/OTP Key Stream Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Key Stream Reuse And Two-Time Pad

[![the_last_dance](../../../_badges/htb-c/the_last_dance.svg)](https://app.hackthebox.com/challenges/the-last-dance)

Many algorithms such as AES are using an implementation based on OTP. It often looks like this the following code internally:

```py
def xor_strings(s1, s2): # Or use: from pwn import xor
    return bytes(b1 ^ b2 for b1, b2 in zip(s1, s2))

key_stream = b'<generation specific to the algorithm>'
plaintext = b'Hello, World!'
ciphertext = xor_strings(key_stream, plaintext) # Encrypt
print("Ciphertext:", ciphertext)
print("Message:", xor_strings(key_stream, ciphertext))  # Decrypt
print("Key stream:", xor_strings(plaintext, ciphertext)) # Compute Partial Key Stream
```

Notice than given the plaintext and the ciphertext, we are able to expose the key stream partially, up to the length of the shortest string.

```yaml!
Ciphertext: b't\x02\t\x02\n^A#\x06\x1d\x02DR'
Message: b'Hello, World!'
Key stream: b'<generation s'
```

This is not a problem when we are using a unique key stream for each message, but it's **when the key stream is reused**.

```py
plaintext1=b'This is a known plaintext'
ciphertext1=b"F2\xb5R\x9c\xc8\xc9\r`\xc5t'w\xa5\xa5\x92\x84$z\xa0\xd0\x1eh)\xdc"
ciphertext2=b't6\xbdF\xc7\xd8\xd5X^\x83p<v\xb6\x94\xdf\x915'

key_stream = xor_strings(plaintext1, ciphertext1)
print("Flag:", xor_strings(key_stream, ciphertext2))
```

And we are able to find the secret message:

```yaml!
Flag: b'flag{you_found_me}'
```

As a side note, we are also able to encrypt messages:

```py
plaintext3=b'message'
ciphertext3 = xor_strings(key_stream, plaintext3)
```
</div><div>

#### Key Stream Reuse And Decipher Oracle

We will use AES OFB with a reused key stream. We have short one message, its ciphertext and another ciphertext.

```py
plaintext1 = b'Hello'
ciphertext1=b'\xff\x82u\\\xb9'
ciphertext2=b'\xd1\x8bxW\xad\x94\x9b/\x98\xdf\x8c\n|*H\xe8\x02\xfay\xa4\x06.\x95\xf6R\xf9'

key_stream = xor_strings(plaintext1, ciphertext1)
print("Flag:", xor_strings(key_stream, ciphertext2))
```

```yaml!
Flag: b'flag{'
```

We are able to ask an oracle if it could decrypt a string, and if the value match the one we expected.

```py
class SecretKeyFactory:
    """
    Assume this code is secret
    """
    key = b'\x9a\x8d\xe5\xf7\x91{R\xf3%\xe1\xf3\x83\xedh\xec\xf1'
    iv = b'\x9a\x8d\xe5\xf7\x91{R\xf3%\xe1\xf3\x83\xedh\xec\xf1'
    secret = b'flag{this_is_a_dummy_flag}'

    def is_equal(self, payload, expected):
        from Crypto.Cipher import AES
        cipher = AES.new(self.key, AES.MODE_OFB, self.iv)
        return cipher.decrypt(payload) == expected
```

We can use the oracle to expose the key stream byte by byte.

```py
final_key_stream = xor_strings(plaintext1, ciphertext1)
for index in range(1, len(ciphertext2) - len(ciphertext1) + 1):
    for i in range(1, 256):
        key_stream = final_key_stream + i.to_bytes()
        plaintext = b'Hello' + b'0' * index
        ciphertext = xor_strings(key_stream, plaintext)
        if sf.is_equal(ciphertext, plaintext):
            final_key_stream += i.to_bytes()
            break

print(xor_strings(final_key_stream, ciphertext2))
```
</div></div>

<hr class="sep-both">

## AES ECB Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### AES ECB — Overview

AES-ECB (Electronic Code Book) is an algorithm splitting data into blocks and using the same key to encrypt each block.

The size of a block is 16 bytes for AES-128 <small>(128bits=16bytes)</small>.

* **Attacks** 🧨: Brute force, Known plaintext
* **Still used?** 🟨: yes, mostly for integrity rather than confidentiality

The main problem with this algorithm is that we will have identical cipher chunks if we have identically plaintext chunks with a message.

#### AES Padding — Overview

[![ecb_oracle](../../../_badges/cryptohack/ecb_oracle.svg)](https://aes.cryptohack.org/ecb_oracle/)

Every AES mode need a cipher of the same length as the key. The most used scheme is AES [pkcs#7](https://en.wikipedia.org/wiki/PKCS_7) in which padding is **always** added.

* The key and the message before padding are 16 bytes
* An empty block with 16 bytes of padding is added
* The padding value is 16 times `0x10` indicating 16 bytes of padding

```shell!
python> from Crypto.Util.Padding import pad
python> pad(b'A'*3, 16).hex() # 13 = 0xd | A = 0x41
4141410d0d0d0d0d0d0d0d0d0d0d0d0d
python> pad(b'A'*16, 16).hex() # 16 = 0x10 = empty block!
4141414141414141414141414141414110101010101010101010101010101010
```

➡️ Quick note: `0x1` would indicate one byte of padding, etc.

#### AES ECB Padding Oracle — Overview

[![ecb_oracle](../../../_badges/cryptohack/ecb_oracle.svg)](https://aes.cryptohack.org/ecb_oracle/)

Assume we have a ciphertext resulting of our input being concatenated to a secret string: `'<input>' + '<secret>'`.

We will test 'a', then 'aa', then 'aaa', and so on until determining the number of characters to create a new block. This new block is the empty padding block. We obtain the length of the secret text with:

* Assuming `n` is the number of injected characters
* Assuming `m-1` is the current number of blocks
* The length of the secret is: `((m-1)*block_length)-n`

```yaml!
Payload: aaaaaa # 6 bytes
Output: 1511c4646146e3d9f7f452f9d31cf8141fa424bc01a4fd6ab47e06ad6da14aa18d481807d004c9162876906be562026e
Blocks: # Assuming AES-126 / 16 bytes / Hex=32 chars
1511c4646146e3d9f7f452f9d31cf814 # 6 bytes here are ours, 10 are not
1fa424bc01a4fd6ab47e06ad6da14aa1 # 16 bytes here are not ours
8d481807d004c9162876906be562026e # Empty padding block
Length: "26" # ((3-1)*16) - 6 = 32 - 6 = 26
```

</div><div>
</div></div>

<hr class="sep-both">

## Random Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### ChaCha20 — Overview

[![the_last_dance](../../../_badges/htb-c/the_last_dance.svg)](https://app.hackthebox.com/challenges/the-last-dance)

ChaCha20 is a stream cipher algorithm that uses XOR similarly to the OTP algorithm. If the key stream <small>(key+nonce)</small> is reused, refer to [this](#key-stream-reuse-and-two-time-pad).

```py
import os
from Crypto.Cipher import ChaCha20
from Crypto.Random import get_random_bytes

plaintext1 = b'This is a known plaintext'
plaintext2 = b'flag{you_found_me}'

key, nonce = os.urandom(32), get_random_bytes(8)
cipher = ChaCha20.new(key=key, nonce=nonce)
ciphertext1 = cipher.encrypt(plaintext1)
cipher = ChaCha20.new(key=key, nonce=nonce)
ciphertext2 = cipher.encrypt(plaintext2)
```

<br>

#### AES CTR — Overview

AES CTR is a mode of AES using a counter. If the key stream <small>(key+CTR)</small> is reused, refer to [this](#key-stream-reuse-and-two-time-pad).

```py
import os
from Crypto.Cipher import AES
from Crypto.Util import Counter
from Crypto.Random import get_random_bytes

plaintext1 = b'This is a known plaintext'
plaintext2 = b'flag{you_found_me}'

key, nonce = os.urandom(16), get_random_bytes(10)
ctr = Counter.new(128 - 10 * 8, nonce)
cipher = AES.new(key, AES.MODE_CTR, counter=ctr)
ciphertext1 = cipher.encrypt(plaintext1)
cipher = AES.new(key, AES.MODE_CTR, counter=ctr)
ciphertext2 = cipher.encrypt(plaintext2)
```

<br>

#### AES OFB — Overview

AES OFB uses AES ECB to generate a key stream by encoding the `IV` using a `key` and repeating the process with generated the ciphertext.

* `IV_0 = AES_ECB(key, IV)`
* `IV_n = AES_ECB(key, IV_{n-1})`
* ... until the key stream is long enough for the message

When the key stream is reused, like others, it [can be exploited](#key-stream-reuse-and-two-time-pad).
</div><div>

#### AES ECB Padding Oracle

We can now generate a ciphertext we can brute force by pushing each byte one by one to the empty padding block.

* First byte: `0x??` + `b'\x0F' * 15`
* Second byte: `0x??` + `0x61` + `b'0x0F' * 14`
* ...

```shell!
python> charset = [i.to_bytes() for i in range(1, 256)]
python> payload_0 = (charset[0] + b'\x0F' * 15) # Test 0x1
python> payload_1 = (charset[1] + b'\x0F' * 15) # Test 0x2
python> ...
```

The same logic can be applied again to decode the remaining characters, but with decrypted bytes instead of padding bytes.

<details class="details-n">
<summary>Python Script To Demonstrate The Process</summary>

```python
import concurrent.futures
import threading

print_lock = threading.Lock()

request_count = 0


def do_encryption(param):
    global request_count
    request_count = request_count + 1
    # Secret Encryption Function
    from Crypto.Cipher import AES
    from Crypto.Util.Padding import pad
    KEY = b'\x00' * 16
    hidden_text = b'flag{this_is_a_dummy_flag}'
    plaintext = bytes.fromhex(param)
    padded = pad(plaintext + hidden_text, 16)
    cipher = AES.new(KEY, AES.MODE_ECB)
    return cipher.encrypt(padded).hex()


def extract_hash(char, padding):
    payload = (char + padding).hex()
    return do_encryption(payload)[:32]

def compute_initial_payload_index(empty_payload):
    payload_length = len(empty_payload)
    length_with_a_new_block = payload_length + 32
    initial_payload_index = None
    empty_payload = None

    for i in range(1, 16):
        payload = (b'\xAA' * i).hex()
        computer_ciphertext = do_encryption(payload)
        print(computer_ciphertext)
        if len(computer_ciphertext) == length_with_a_new_block:
            initial_payload_index = i
            empty_payload = computer_ciphertext[-32:]
            break

    if initial_payload_index is None:
        print("[!] Error, could not compute initial_payload_index.")
        exit(2)

    print(length_with_a_new_block)

    m = length_with_a_new_block // 32
    hidden_text_length = ((m - 1) * 16) - initial_payload_index

    print("[+] We created a new block after injecting " + str(initial_payload_index) + " characters.")
    print("[+] The previous length was " + str(payload_length) + "; now it's "+ str(length_with_a_new_block) +".")
    print("[+] The hidden payload length is " + str(hidden_text_length) + ".")
    print("[+] The empty payload is " + empty_payload + ".")

    return initial_payload_index + 1, hidden_text_length, empty_payload


with concurrent.futures.ThreadPoolExecutor(max_workers=64) as executor:
    flag = ""
    charset = [ord(i).to_bytes() for i in "abcdefghijklmnopqrstuvwxyz0123456789{}_ABCEDFGHIJKLMNOPQRSTUVWXYZ"]
    for i in range(1, 256):
        if i not in charset:
            charset.append(i.to_bytes())
    payload_offset = 0
    payload_frame = 0
    initial_payload_index, hidden_text_length, empty_payload = compute_initial_payload_index(do_encryption(b''.hex()))

    # We are reading ${hidden_text_length} bytes
    for offset in range(0, hidden_text_length):
        payload_to_compute = (b'\xAA' * (initial_payload_index + payload_offset + offset)).hex()
        result = do_encryption(payload_to_compute)
        result_len = len(result)
        ciphertext_to_compute = result[-32-payload_frame:result_len-payload_frame]

        if ciphertext_to_compute == empty_payload:
            payload_offset += 16
            payload_frame += 32
            ciphertext_to_compute = result[-32 - payload_frame:result_len - payload_frame]

        padding_count = (payload_offset + 15) - offset
        padding = flag.encode() + (padding_count.to_bytes() * padding_count)

        with print_lock:
            print("[+] Moving " + str(offset+1) + " byte.")
            print("[+] Trying to brute force '" + ciphertext_to_compute + "'.")
            print("[+] It should correspond to b'\\x??' + " + str(padding) + ".")

        executor_manager = {executor.submit(extract_hash, char, padding): char for char in charset}
        for future in concurrent.futures.as_completed(executor_manager):
            associated_char = executor_manager[future]
            computer_ciphertext = future.result()
            if computer_ciphertext == ciphertext_to_compute:
                flag = chr(int(ord(associated_char).to_bytes().hex(), 16)) + flag

                # Cancel Every Task
                for task_to_cancel in executor_manager:
                    task_to_cancel.cancel()
                break

        with print_lock:
            print(f"[+] Current flag is '{flag}'.")

print(f"[+] The final flag is '{flag}'.")
print(f"[+] It took so many encryption requests: '{request_count}' :/.")
```
</details>

📚 We did it from right to left, it could be done from left ro right.
</div></div>

<hr class="sep-both">

## Random Notes

<div class="row row-cols-lg-2"><div>

#### Modulus of Product And Subtraction

[![babyencryption](../../../_badges/htb-c/babyencryption.svg)](https://app.hackthebox.com/challenges/babyencryption)

To decode a message encoded with `(a * x - b) % c`, we need to reverse each operation giving us `(a^{-1} * (x+b)) % c`.

```py
a = 53
b = 8
c = 256
modular_inverse_of_a = 29
```

```py
def encode(string):
    bytes = []
    for char in string:
        bytes.append((a * ord(char) - b) % c)
    return bytes
```

```py
def decode(bytes):
    string = ''
    for byte in bytes:
        string += chr((modular_inverse_of_a * (byte + b)) % c)
    return string
```

#### Modulus of Sum In XOR

[![pyc_bytecode](../../../_badges/rootme/cracking/pyc_bytecode.svg)](https://www.root-me.org/en/Challenges/Cracking/PYC-ByteCode)

If we have `encrypt(c: char) = XOR(ord(c)+salt[c], key[c]) % 255`:

```text!
encrypt(H) = XOR(72+5, 119) % 255 = 58
encrypt(e) = XOR(101+12, 108) % 255 = 29
...
```

It implies `decrypt(c: int) = (XOR(c, key[c]) % 255) - salt[c]`:

```text!
decrypt(58) = (XOR(58, 119) % 255) - 5 = H
decrypt(29) = (XOR(29, 108) % 255) - 12 = e
...
```
</div><div>

#### Chained Algorithms

[![pythonplayground](../../../_badges/thm-p/pythonplayground.svg)](https://tryhackme.com/r/room/pythonplayground)

If a message is encoded by applying multiple functions, you need to reverse each function and call them in the reverse order.

```py
def encode(s):
    def a(string):        
        int_array = []
        for i in range(len(string)):
            char_code = ord(string[i])
            int_array.append(math.floor(char_code / 26))
            int_array.append(char_code % 26)
        return int_array

    def b(int_array):
        string = ''
        for value in int_array:
            string += chr(97 + value)
        return string

    return b(a(b(a(s))))
```

```py
def decode(s):
    def a(int_array):
        string = ''
        for i in range(0, len(int_array), 2):
            string += chr(int_array[i] * 26 + int_array[i+1])
        return string

    def b(string):
        return [ord(char) - 97 for char in string]

    return a(b(a(b(s))))
```

</div></div>