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
## @deftypefn {Function File} {@var{C} =} QASMmeasure (@var{t})
##
## Construct a measurement gate that targets qubits @var{t}
## Users should not construct gates directly but instead use
## some combination of QIR, horzcat, and qcc
##
##
## @seealso{QIR,qcc, @@QIRcircuit/horzcat }
##
## @end deftypefn

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: QASM


function g = QASMmeasure(tars)

  if( nargin == 0)
    g.meas = @meas([]);
  else
    g.meas = @meas(tars);
  endif
  g = class(g,"QASMmeasure");

endfunction
