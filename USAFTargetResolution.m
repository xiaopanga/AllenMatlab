function [LPPerMM]=USAFTargetResolution(group,element)

LPPerMM=2^(group+(element-1)/6);
end