function [out] = prohledovani(in)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  out = 0;
  [numRows, numCols] = size(in)
  for i = 1:numRows
      for j = 1:numCols
          if i ~= j
              out = out + in(i, j);
              disp(out);
          end
      end
  end

  %out = inputArg1;
end

