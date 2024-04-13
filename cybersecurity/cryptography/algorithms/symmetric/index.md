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
[![ecb_oracle](../../../_badges/rootme/cryptanalysis/aes_ecb_copy_paste.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/AES-ECB-Copy-Paste)
[![ecb_oracle](../../../_badges/cryptohack/ecb_oracle.svg)](https://aes.cryptohack.org/ecb_oracle/)

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
class SecretFactory:
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
s = SecretFactory()
final_key_stream = xor_strings(plaintext1, ciphertext1)
for index in range(1, len(ciphertext2) - len(ciphertext1) + 1):
    for i in range(1, 256):
        key_stream = final_key_stream + i.to_bytes()
        plaintext = b'Hello' + b'0' * index
        ciphertext = xor_strings(key_stream, plaintext)
        if s.is_equal(ciphertext, plaintext):
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

#### AES ECB — Padding Oracle

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

Now, if we write seven bytes instead of six, it means the last block will go from `b"\x10" * 16` to `b"?" + b"\x0f" * 15` with the first char, which is the last char of the flag, unknown to us.

Let's note the block ciphertext `18f9896be0f97a3329f8b9dc3f42c887`. Now, we can try to brute force it by testing all characters followed by `b"\x0f" * 15`. When we got a match, we can infer the character:

```yaml!
Payload: b'\xa5\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f'
Output: 707e71555d22792d2cdf7ba7e6b50dba
...
Payload: b'}\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f'
Output: 18f9896be0f97a3329f8b9dc3f42c887 # Found!
```

The same logic can be applied again and again to decode the remaining characters. The next payload would be similar to:

```yaml!
Payload: b'\xa5}\x0e\x0e\x0e\x0e\x0e\x0e\x0e\x0e\x0e\x0e\x0e\x0e\x0e\x0e'
...
```

<details class="details-n">
<summary>Python Script To Demonstrate The Process</summary>

```python
import concurrent.futures

class SecretFactory:
    """
    Assume this code is secret
    """
    KEY = b'\x0c1%\xe7\xcb\x01\xf3\x0f\x1e\xfcu\xebh\x1b\xce\x9c'
    flag = b'flag{this_is_a_dummy_flag}'

    def encrypt(self, plaintext):
        from Crypto.Cipher import AES
        from Crypto.Util.Padding import pad
        cipher = AES.new(self.KEY, AES.MODE_ECB)
        return cipher.encrypt(pad(plaintext + self.flag, 16))


s = SecretFactory()

# Determine The Padding Block
payload_length = len(s.encrypt(b'')) + 16
for i in range(1, 16):
    ciphertext = s.encrypt(b'\xAA' * i)
    if len(ciphertext) == payload_length:
        offset = i
        padding_block = ciphertext[-16:]
        break

m = payload_length // 16
hidden_text_length = ((m - 1) * 16) - offset
print("[+] The hidden payload length is " + str(hidden_text_length) + ".")
print("[+] The empty payload is " + padding_block.hex() + ".")

# Without any order: [i.to_bytes() for i in range(1, 256)]
charset = [ord(i).to_bytes() for i in "abcdefghijklmnopqrstuvwxyz0123456789{}_ABCEDFGHIJKLMNOPQRSTUVWXYZ"]
charset += [b'\x01', b'\x02', b'\x03', b'\x04', b'\x05', b'\x06', b'\x07', b'\x08', b'\t', b'\n', b'\x0b', b'\x0c', b'\r', b'\x0e', b'\x0f', b'\x10', b'\x11', b'\x12', b'\x13', b'\x14', b'\x15', b'\x16', b'\x17', b'\x18', b'\x19', b'\x1a', b'\x1b', b'\x1c', b'\x1d', b'\x1e', b'\x1f', b' ', b'!', b'"', b'#', b'$', b'%', b'&', b"'", b'(', b')', b'*', b'+', b',', b'-', b'.', b'/', b':', b';', b'<', b'=', b'>', b'?', b'@', b'[', b'\\', b']', b'^', b'`', b'|', b'~', b'\x7f', b'\x80', b'\x81', b'\x82', b'\x83', b'\x84', b'\x85', b'\x86', b'\x87', b'\x88', b'\x89', b'\x8a', b'\x8b', b'\x8c', b'\x8d', b'\x8e', b'\x8f', b'\x90', b'\x91', b'\x92', b'\x93', b'\x94', b'\x95', b'\x96', b'\x97', b'\x98', b'\x99', b'\x9a', b'\x9b', b'\x9c', b'\x9d', b'\x9e', b'\x9f', b'\xa0', b'\xa1', b'\xa2', b'\xa3', b'\xa4', b'\xa5', b'\xa6', b'\xa7', b'\xa8', b'\xa9', b'\xaa', b'\xab', b'\xac', b'\xad', b'\xae', b'\xaf', b'\xb0', b'\xb1', b'\xb2', b'\xb3', b'\xb4', b'\xb5', b'\xb6', b'\xb7', b'\xb8', b'\xb9', b'\xba', b'\xbb', b'\xbc', b'\xbd', b'\xbe', b'\xbf', b'\xc0', b'\xc1', b'\xc2', b'\xc3', b'\xc4', b'\xc5', b'\xc6', b'\xc7', b'\xc8', b'\xc9', b'\xca', b'\xcb', b'\xcc', b'\xcd', b'\xce', b'\xcf', b'\xd0', b'\xd1', b'\xd2', b'\xd3', b'\xd4', b'\xd5', b'\xd6', b'\xd7', b'\xd8', b'\xd9', b'\xda', b'\xdb', b'\xdc', b'\xdd', b'\xde', b'\xdf', b'\xe0', b'\xe1', b'\xe2', b'\xe3', b'\xe4', b'\xe5', b'\xe6', b'\xe7', b'\xe8', b'\xe9', b'\xea', b'\xeb', b'\xec', b'\xed', b'\xee', b'\xef', b'\xf0', b'\xf1', b'\xf2', b'\xf3', b'\xf4', b'\xf5', b'\xf6', b'\xf7', b'\xf8', b'\xf9', b'\xfa', b'\xfb', b'\xfc', b'\xfd', b'\xfe', b'\xff']
payload_offset = 0
flag = ""

with concurrent.futures.ThreadPoolExecutor(max_workers=64) as executor:
    for index in range(1, hidden_text_length + 1):
        target_payload = (b'a' * (offset + payload_offset + index))
        full_target_ciphertext = s.encrypt(target_payload)
        full_target_ciphertext_len = len(full_target_ciphertext)
        target_ciphertext = full_target_ciphertext[-16 - payload_offset:full_target_ciphertext_len - payload_offset]

        if target_ciphertext == padding_block:
            payload_offset += 16
            target_ciphertext = full_target_ciphertext[-16 - payload_offset:full_target_ciphertext_len - payload_offset]

        # Index = 1, then we would have b'<char>' + b'0x0f' * (15 - 1 + 1 = 15)
        padding_count = (payload_offset + 15) - index + 1
        padding = flag.encode() + (padding_count.to_bytes() * padding_count)

        print("[+] Moving " + str(index) + " byte.")
        print("[+] Trying to brute force '" + target_ciphertext.hex() + "'.")
        print("[+] It should correspond to b'\\x??' + " + str(padding) + ".")

        extract_hash = lambda s, char, padding: s.encrypt(char + padding)[:16]
        executor_manager = {executor.submit(extract_hash, s, char, padding): char for char in charset}
        for future in concurrent.futures.as_completed(executor_manager):
            associated_char = executor_manager[future]
            computed_ciphertext = future.result()
            if computed_ciphertext == target_ciphertext:
                flag = chr(int(ord(associated_char).to_bytes().hex(), 16)) + flag

                # Cancel Every Task
                for task_to_cancel in executor_manager:
                    task_to_cancel.cancel()
                break

        print(f"[+] Current flag is '{flag}'.")
print(f"[+] Final flag is '{flag}'.")
```
</details>

📚 There are more optimized ways to do this.
</div><div>

#### AES ECB — Cipher Blocks Manipulation

[![ecb_oracle](../../../_badges/rootme/cryptanalysis/aes_ecb_copy_paste.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/AES-ECB-Copy-Paste)

AES ECB generates its blocks independently of each other. It means that we may be able to extract encoded sections from different ciphertexts and generate a valid malicious ciphertext.

For instance, assuming a JSON payload is crafted from the user input, we can inject a JSON within the JSON and get its ciphertext. 

```python
class SecretFactory:
    """
    Assume this code is secret
    """
    KEY = b'\x0c1%\xe7\xcb\x01\xf3\x0f\x1e\xfcu\xebh\x1b\xce\x9c'
    flag = b'flag{this_is_a_dummy_flag}'

    def get_token(self, payload):
        from Crypto.Cipher import AES
        from Crypto.Util.Padding import pad
        import json

        if not isinstance(payload, dict) or 'username' not in payload or 'can_read_the_flag' not in payload:
            return b'Expected format: {"username": "admin", "canReadTheFlag": True}'
        if payload['username'] == 'admin':
            return b"Error: You cannot request a token with 'username' set to 'admin'..."
        if payload['can_read_the_flag']:
            return b"Error: Only 'admin' can have 'can_read_the_flag' set to 'true'..."

        try:
            cipher = AES.new(self.KEY, AES.MODE_ECB)
            payload = json.dumps(payload)
            print(pad(payload.encode('unicode_escape'), 16))
            return cipher.encrypt(pad(payload.encode(), 16))
        except Exception:
            return b'Oops, something went wrong.'

    def get_the_flag(self, payload):
        from Crypto.Cipher import AES
        from Crypto.Util.Padding import unpad
        import json

        message = b'No flag for you!'
        try:
            cipher = AES.new(self.KEY, AES.MODE_ECB)
            plaintext = unpad(cipher.decrypt(payload), 16)
            plaintext = plaintext.decode('unicode_escape')
            data = json.loads(plaintext)
            if data['username'] == 'admin' and data['can_read_the_flag']:
                message = self.flag
        except Exception as e:
            print(e)
            pass
        return message.decode()

s = SecretFactory()
# Part1: 7eb26de3ea6875d22f0734229d7f00f9 {"username": "oo
# Part2: c5f15c4e69d793e769c6cbf746e8c4ac {\"username\":\"
# Part3: 630fab6ed7bb753f9f6ec738cee28a43 admin\",\"can_re
# Part4: 51e610797d8ac7149ec3e549895c6baf ad_the_flag\";tr
# Part5: df5e947e0e8d29d7aca4a75c92384879 ue,\"dummy\":12}
# Part6: 0fb3b6af52e536be88aed7dfc91b5493 aa", "can_read_t
# Part7: c70c463ebbc670cf9a1ea4ae2245c603 he_flag": false}
# Part8: 8d481807d004c9162876906be562026e <empty padding>
ciphertext = s.get_token({"username": 'oo{"username":"admin","can_read_the_flag":true,"dummy":12}aa', "can_read_the_flag": False})
ciphertext_parts = [ciphertext[chunk:chunk+16].hex() for chunk in range(0, len(ciphertext), 16)]
# Merge Part2 + Part3 + Part4 + Part5 + Part 7 (last block)
fake_ciphertext = bytes.fromhex(''.join(ciphertext_parts[1:5]) + ciphertext_parts[-1])
print(s.get_the_flag(fake_ciphertext))
```

📚️ If not for `unicode_escape`, it would not have been impossible I think, as the quotes in the JSON username value are escaped twice.
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

#### AES OFB — Overview

AES OFB uses AES ECB to generate a key stream by encrypting the `IV` using a `key` and repeating the process with generated the ciphertext.

* `key_stream = b''`
* `IV_0 = AES_ECB(key, IV)` and add it to key_stream
* `IV_n = AES_ECB(key, IV_{n-1})` and add it to key_stream
* ... until the key stream is long enough for the plaintext

To encrypt/decrypt, use `XOR(key_stream, plaintext)`.

When the key stream is reused, like others, it [can be exploited](#key-stream-reuse-and-two-time-pad).
</div><div>

#### AES CBC — Overview

AES CBC is similar to AES OFB, but it operates of the generated ciphertext and not on the key stream.

* `ciphertext_0 = AES_ECB(key, XOR(plaintext_0, IV))`
* `ciphertext_n = AES_ECB(key, XOR(plaintext_n, ciphertext_{n-1}))`
* ... until you have encrypted all of the plaintext parts

<details class="details-n">
<summary>AES CBC Code Samples</summary>

Hard-coded KEY and IV for testing:

```py
from Crypto.Util.Padding import pad, unpad
KEY = b'\x0c1%\xe7\xcb\x01\xf3\x0f\x1e\xfcu\xebh\x1b\xce\x9c'
IV = b'\xbe\xed\xd7~`\xfaB_"\xe1ft\x13/\xcb\x14'
plaintext = pad(b'flag{aes_cbc_just_4_fun}', 16)
```

Using the crypto library:

```py
from Crypto.Cipher import AES
cipher = AES.new(KEY, AES.MODE_CBC, iv=IV)
ciphertext = cipher.encrypt(plaintext)
cipher = AES.new(KEY, AES.MODE_CBC, iv=IV)
plaintext = unpad(cipher.decrypt(ciphertext), 16)
print("[+] Ciphertext is", ciphertext)
print("[+] Plaintext is", plaintext)
```

Using partially the crypto library:

```py
from Crypto.Cipher import AES

plaintext_parts = [plaintext[chunk:chunk+16] for chunk in range(0, len(plaintext), 16)]
cipher = AES.new(KEY, AES.MODE_ECB)
ciphertext = b""
previous_block = IV
for plaintext_part in plaintext_parts:
    block = xor_strings(plaintext_part, previous_block)
    encrypted_block = cipher.encrypt(block)
    ciphertext += encrypted_block
    previous_block = encrypted_block

ciphertext_parts = [ciphertext[chunk:chunk+16] for chunk in range(0, len(ciphertext), 16)]
cipher = AES.new(KEY, AES.MODE_ECB)
plaintext = b''
key_stream = IV
for ciphertext_part in ciphertext_parts:
    decrypted_block = cipher.decrypt(ciphertext_part)
    plaintext += xor_strings(decrypted_block, key_stream)
    key_stream = ciphertext_part

print("[+] Ciphertext is", ciphertext)
print("[+] Plaintext is", unpad(plaintext, 16))
```
</details>

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