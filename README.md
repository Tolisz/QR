# QR algorithm

QR algoritm for eigenvalues of a Hessenberg matrix. 

# Main Function 

The main funciton of the program is 

```Matlab
[eigs, success] = QRshift(H, tol);
```

An example of using this funtion for simple matrix

```Matlab
>> A = [1, 2, 3; 4, 5, 6; 7, 8, 9];
>> eigs = QRshift(hess(A), 1e-16)'
eigs =
   16.1168   -1.1168   -0.0000
```
