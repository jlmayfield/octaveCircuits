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
## @deftypefn {Function File} {@var{p} =} zyzparams (@var{U})
##
## Compute the ZYZ parameters of a 2x2 unitary equivalent to @var{U}.
##
## Any 2x2 unitary matrix @var{U} can parameterized by as the composition of a rotation about the Z, then Y, then Z axes, possibly with a global phase factor. Calling @code{zyzparams(@var{U}} returns the ZYZ parameter vector @var{p} corresponding to unitary @var{U} where @code{@var{p}(1)} is angle of rotation for the first Z axis rotation, @code{@var{p}(2)} is the angle of rotation for the Y axis rotation, @code{@var{p}(3)} is the angle of rotation for the final Z axis rotation, and @code{@var{p}(4)} is the global phase factor.
##
## @seealso{phaseampparams,Rnparams,U2zyz,U2Rn,U2phaseamp}
## @end deftypefn

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: Operators

function p = zyzparams(U)

  if(!isequal(size(U),[2,2]) )
    error("Operator size mismatch. Must be 2x2 Unitary.");
  endif

  ## get phase amp params
  ph = phaseampparams(U);

  ## [z1,y,z2,global]
  p = [ph(3),2*ph(1),ph(2),ph(4)];


endfunction

%!test
%! close = 2^-50;
%! fail('zyzparams(eye(3))');
%! assert(abs(zyzparams(eye(2))-[0,0,0,0]) < close,"I failed");
%! assert(abs(zyzparams(X)-[pi,pi,0,pi/2]) < close, "X failed");
%! assert(abs(zyzparams(Y)-[0,pi,0,pi/2]) < close, "Y failed");
%! assert(abs(zyzparams(Z)-[pi,0,0,pi/2]) < close, "Z failed");
%! assert(abs(zyzparams(H)-[0,pi/2,pi,pi/2]) < close, "H failed");

%!test
%! close = 2^(-35);
%! for k = 1:200
%!   randparams = [unifrnd(0,2*pi,1,1),unifrnd(0,pi,1,1), ...
%!                 unifrnd(0,2*pi,1,2)];
%!   U = U2zyz(randparams);
%!   p = zyzparams(U);
%!   diff = abs(randparams-p);
%!   assert( diff < close , "%f ", randparams, p  );
%! endfor
%!
