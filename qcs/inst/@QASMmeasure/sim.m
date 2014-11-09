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

## Usage: [y,t] = sim(gate,in,bits,currd,dlim,currt,tlim)
## 
##  simulate the action of a @QASMmeasure 'gate' on pure state
##  'in' in a system of size 'bits'.  The current simulation depth is
##  currd and dlim is the user specified simulation depth limit.
##  Similarly, currt is the current simulation time step (w.r.t to
##  dlim) and tlim is the user specified number of steps to simulate.
##  The simulation returns two results, the pure state y that results
##  from the operator and the current time step t. 
## 
## 

## Author: Logan Mayfield
## Keyword: QASM

function [y,t] = sim(gate,in,bits,currd,dlim,currt,tlim)
  [y,t] = sim(gate.meas,in,bits,currd,dlim,currt,tlim);
endfunction

%!test
%! x = stdBasis(5,3);
%! for i = 1:30
%!  s =  sim(@QASMmeasure([]),x,3,0,1,0,1);
%!  assert(s,stdBasis(5,3))
%! endfor

## probably better ways to test in the presence of 
## non-determinism 

%!test
%! x = 1/2*[1,-1,1,-1]';
%! res = zeros(4,1); 
%! for i = 1:250
%!   s = sim(@QASMmeasure([]),x,2,0,1,0,1);
%!   res(find(s))++;
%! endfor
%! res = res ./ 250;
%! assert(1/4,mean(res),0.000001)

## pure state, partial mesaurement tests
%!test
%! x = (1/2)*[1,-1,1,-1]';
%! r = zeros(4,1);
%! for k = [1:500]
%!  r = r + sim(@QASMmeasure([1]),x,2,0,1,0,1);
%! endfor
%! expect = (1/(2*sqrt(2)))*[1,-1,1,-1]';
%! assert(r/500,expect,0.1);
%!
%! r = zeros(4,1);
%! for k = [1:500]
%!  r = r + sim(@QASMmeasure([0]),x,2,0,1,0,1);
%! endfor
%! expect = (1/(2*sqrt(2)))*[1,-1,1,-1]';
%! assert(r/500,expect,0.1);

## multiple partial measurements
%!test
%! x = (1/2)*[1,1,1,1,0,0,0,0]';
%! r = zeros(8e,1);
%! for k = [1:500]
%!  r = r + sim(@QASMmeasure([0,1]),x,3,0,1,0,1);
%! endfor
%! expect = (1/4)*[1,1,1,1,0,0,0,0]';
%! assert(r/500,expect,0.1);

