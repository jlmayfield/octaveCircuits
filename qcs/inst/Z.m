## Copyright (C) 2014  James Logan Mayfield
##
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {@var{U} =} Z (@var{n})
##
## Compute the Pauli Z matrix.
##
## Given no inputs @code{Z} returns the single qubit Pauli Z matrix. For any @math{@var{n}>1} it returns the @var{N}th tensor power of @code{Z}.
##
## @seealso{Iop,H,Y,X,S,T,Rx,Ry,Rz,Rn,Ph}
## @end deftypefn

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: Operators

function U = Z(n=1)

  ## error check number of qubits
  if( n <= 0 )
    error("Number of qubits must be 1 or greater. Given n=%d",n);
  endif

  U = [1];
  Z1 = [1,0;0,-1];
  for i = 1:n
    U = kron(U,Z1);
  endfor

endfunction


%!test
%! Z1 = [1,0;0,-1];
%! assert(Z,Z1);
%! assert(kron(Z1,Z1),Z(2));
%! assert(kron(Z1,kron(Z1,Z1)),Z(3));
