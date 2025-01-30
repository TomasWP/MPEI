function hashCode = hf1(element,nhf)
% USAGE EXAMPLE: hc=hf1('abcd',3)
% input : element  - string 
%         nhf      - number of the hash function to apply (1 to 5)
% output: hashCode - from 1 to 1013 (M)     

% AT, jan 2025

%% configuration parameter. Do not chage
n = 5;  % max number of hash function
M = 1013; % to limit hashcode to M-1
 

%% check if nhf in the correct range
if nhf <1 || nhf > n
    fprintf(1,'ERROR! hf number must be between 1 and %d\n',n);
    hashCode = -1;
    return
end

%% coefficients
R =[ 
       26792       93112       34134       12610       43731
       65974       53115       80643       55212        8136
       63586       13456       56808       45561       22226
       15784       14491       53358        1156       88652
       11551       24995       89026       32723       14791
       48373       81603       27745       15742       80157
       93156       24682       73497       77096       52254
       33039       79037       73160       30208       96688
       56808       23638       36928       51302        7588
       21724       90198       55115       16079       42968
       72921       33971        7363       58431       10353
       24761       19083        5237       25525       93365
       49110       24371       51521       63487         450
       67855       59796       75629       66898       75216
       86474       45939       90658       72618       79330
       ]';

l = size(R,2);  %    

%% use only l chars. Pad with spaces if  shorter than l
kept = element;
if length(element) < l
    desired_length = l;   
    element = sprintf('%-*s', desired_length, element);   
else
    element = element(1:l); % keep only 1st l chars
end


R=R(:,1:l);
 
% each line of R defines a different hash function
r=R(nhf,:);

%   (\sum r * x ) mode M
hashCode=mod(sum (r.*  double(element)),M)+1;

% uncomment to see results during debugging 
%fprintf("%s -> %d\n",element,hashCode)



