# secp256k1
Mathematically. secp256k1 is an elliptic curve which is defined over a set of finite fields `Fp` when we say finite, we mean the value ranges from `1 to p -1` where `p` is a prime number that ranges between `2 ^ 256 - 2 ^ 32 - 977 ` this is a very solid prime number which does not create extra spaces or holes in the algorithm. The name secp256k1 is derived because it's a secure algorithm which has about 256 bits of data and k1 is a special family of curves. 

> secp256k1 is the elliptic curve used especially in Bitcoin for wallet transactions signing and verifications

# Theorems
The secp256k1 theorizes that a line which passes or cuts across two points on the curve `P and Q` must also touch another third point `R` on the elliptic curve, this is denoted by the formula `y^2 = x^3 + 7 (mod p)` where x and y are points on the curve, they are distinct points on the curve.

## Operations
For the secp256k1 there are two points on the curve denoted as `p` and `q` and when these are added together ` p + q ` they form another point on the curve where `p ≠ q` which means they are distinct, when this operation occur, we call that point addition. where `p = (x1, y1)` and `q = (x2, y2)`.

point doubling operation in an elliptic curve is done when both points on the curve are the same which is P = Q which satisfies the formula where 

```shell 
 p = (xº, yº) q = (xª, yª) 
 x¡ = ¡2 -  xº - xª but if xº = xª then x¡ = ¡2 - 2x¡ for p = q
```