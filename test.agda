module test where

data Bool : Set where
    True  : Bool
    False : Bool

!_ : Bool → Bool
! True  = False
! False = True

if_then_else_ : {A : Set} → Bool → A → A → A
if True then x else y = x
if False then x else y = y

data ℕ : Set where
    zero : ℕ
    suc  : ℕ → ℕ

_+_ : ℕ → ℕ → ℕ
zero + a = a
suc a + b = suc (a + b)

low = suc zero
high = low + (low + low)

data List (A : Set) : Set where
    Nil  : List A
    Cons : A → List A → List A

length : {A : Set} → List A → ℕ
length Nil = zero
length (Cons x x₁) = suc (length x₁)

map : {A B : Set} → (A → B) → List A → List B
map f Nil = Nil
map f (Cons x l) = Cons (f x) (map f l)

concat : {A : Set} → List A → List A → List A
concat Nil m = m
concat (Cons x l) m = Cons x (concat l m)
