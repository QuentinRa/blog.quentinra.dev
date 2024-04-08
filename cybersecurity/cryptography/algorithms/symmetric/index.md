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

The **Advanced Encryption Standard**, abbreviated as **AES**, is a part of the **Block ciphers** algorithms.

<details class="details-n">
<summary>AES-ECB (Electronic Code Book)</summary>

Using this mode, each block is encrypted using the same key. 

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
* **Attacks** 🧨
  * Brute force attack
  * Known plaintext attack
  * Side-channel/timing attacks
* **Try it online** 🌍: [One Time Pad (boxentriq.com)](https://www.boxentriq.com/code-breaking/one-time-pad)
* **Still used?** 🟩: yes, it's widely used <small>(AES-GCM/AES-CCM/...)</small>
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### ChaCha20 (XOR)

[![the-last-dance](../../../_badges/htb-c/the-last-dance.svg)](https://app.hackthebox.com/challenges/the-last-dance)

ChaCha20 is a stream cipher algorithm that uses XOR similarly to the OTP algorithm. Given the plaintext and the cipher text, we can use XOR to get the key stream <small>(key+nonce)</small>.

```py
def xor_strings(s1, s2):
    return bytes(b1 ^ b2 for b1, b2 in zip(s1, s2))
    
message = b''
ciphertext = b''
key_stream = xor_strings(message, ciphertext)
```

If the key and the nonce were reused to encrypt another message, then we can use the key stream to decrypt it.

```py
ciphertext_2 = b''
padding_length = len(key_stream) - len(ciphertext_2)
ciphertext_2 += b'\x00' * padding_length
message_2 = xor_strings(key_stream, ciphertext_2)
```
</div><div>

#### AES ECB Padding Oracle

Assuming we have a ciphertext from `<userinput>+<unknown_text>` and we know the padding scheme, we can decrypt `<unknown_text>`.

The size of a block is 16 bytes. If the plaintext is shorter, padding is added with `0xN` the number of missing bytes <small>(maximum is `\x10`=16)</small>.

```shell!
python> from Crypto.Util.Padding import pad
python> pad(b'\xAA'*3, 16).hex()
aaaaaa0d0d0d0d0d0d0d0d0d0d0d0d0d
python> pad(b'\xAA'*16, 16).hex() # The second block is empty!
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa10101010101010101010101010101010
```

Assuming the target uses the padding function above, we can first learn the size of the unknown text by determining after how many bytes the new empty block is created <small>(block_size=16, inject n, got m rows)</small>.

```shell!
python> pad(b'\xAA'*n + unknown_text, 16).hex()
python> # If you got "m" blocks, then len is ((m-1)*16)-n
python> # Note: m-1 as we discard the empty block
```

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