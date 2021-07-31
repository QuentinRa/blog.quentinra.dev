# Function

[Go back](../c.md)

```c
/*!
* \brief short description
*
* This is a long description
*
* \param[in] x ...
* \param[in,out] y ...
* \param z ...
* 
* \return ...
* \see ...
*/
int pow(const int x, const int k);
```

Explanations

* ``\param name``: a parameter in
* ``\param[in] name``: a parameter that is only read, may be `const`
* ``\param[out] name``: a parameter that will be overridden
* ``\param[in,out] name``: may be read or overridden or both
* ``return ...``: what's returned by the function