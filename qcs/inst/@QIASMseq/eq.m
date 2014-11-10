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

## Usage: b = eq(this,other)
##
## returns true if @QIASMseq this is equivalent to other.
##

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: QIASM

function b = eq(this,other)
  b = isa(other,"QIASMseq") && ...
      eq(this.seq,other.seq);
endfunction



%!test
%! a = @QIASMseq({@QIASMsingle("H",1),@QIASMcNot(0,1)});
%! b = @QIASMseq({@QIASMsingle("H",1),@QIASMcNot(0,1)});
%! c = @QIASMseq({@QIASMsingle("H",1)});
%! d = @QIASMseq({@QIASMsingle("H",1),@QIASMcNot(0,1),@QIASMseq({@QIASMmeasure()})});
%! e = @QIASMseq({@QIASMsingle("H",1),@QIASMcNot(0,1),@QIASMseq({@QIASMmeasure()})});
%! assert(eq(a,a));
%! assert(eq(a,b));
%! assert(eq(d,e));
%! assert(!eq(a,c));
%! assert(!eq(a,d));

