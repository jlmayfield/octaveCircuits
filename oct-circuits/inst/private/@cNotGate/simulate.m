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

## Usage: y = simulate(gate,in,bits)
## 
##  simulate the action of a CNot gate 'gate' on pure state
##  'in' in an n bits system
## 

## Author: Logan Mayfield
## Keyword: Circuits


function y = simulate(gate,in,bits,currd,dlim,currt,tlim)
	 
  if( currt > tlim || currd > dlim )
    y = zeros(2^bits,1);
  else
    y = applyCNot(in,gate.ctrl,gate.tar,bits);
  endif

endfunction
