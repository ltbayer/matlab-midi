
% initialize matrix:
N = 501;  % num notes
M = zeros(N,6);

M(:,1) = 1;         % all in track 1
M(:,2) = 1;         % all in channel 1
% M(:,3) = (60:72)';      % note numbers: one ocatave starting at middle C (60)
% take pi (without the decimal) as a sequence (first 10 to start).
% for each number in the sequence, convert it to mod 7
% 0 corresponds to middle C (60)
% 1 corresponds to 62 
% 2 corresponds to 64
% 3 corresponds to 65
% 4 corresponds to 67
% 5 corresponds to 69
% 6 corresponds to 71
pi = [3 1 4 1 5 9 2 6 5 3 5 8 9 7 9 3 2 3 8 4 6 2 6 4 3 3 8 3 2 7 9 5 0 2 8 8 4 1 9 7 1 6 9 3 9 9 3 7 5 1 0 5 8 2 0 9 7 4 9 4 4 5 9 2 3 0 7 8 1 6 4 0 6 2 8 6 2 0 8 9 9 8 6 2 8 0 3 4 8 2 5 3 4 2 1 1 7 0 6 7 9 8 2 1 4 8 0 8 6 5 1 3 2 8 2 3 0 6 6 4 7 0 9 3 8 4 4 6 0 9 5 5 0 5 8 2 2 3 1 7 2 5 3 5 9 4 0 8 1 2 8 4 8 1 1 1 7 4 5 0 2 8 4 1 0 2 7 0 1 9 3 8 5 2 1 1 0 5 5 5 9 6 4 4 6 2 2 9 4 8 9 5 4 9 3 0 3 8 1 9 6 4 4 2 8 8 1 0 9 7 5 6 6 5 9 3 3 4 4 6 1 2 8 4 7 5 6 4 8 2 3 3 7 8 6 7 8 3 1 6 5 2 7 1 2 0 1 9 0 9 1 4 5 6 4 8 5 6 6 9 2 3 4 6 0 3 4 8 6 1 0 4 5 4 3 2 6 6 4 8 2 1 3 3 9 3 6 0 7 2 6 0 2 4 9 1 4 1 2 7 3 7 2 4 5 8 7 0 0 6 6 0 6 3 1 5 5 8 8 1 7 4 8 8 1 5 2 0 9 2 0 9 6 2 8 2 9 2 5 4 0 9 1 7 1 5 3 6 4 3 6 7 8 9 2 5 9 0 3 6 0 0 1 1 3 3 0 5 3 0 5 4 8 8 2 0 4 6 6 5 2 1 3 8 4 1 4 6 9 5 1 9 4 1 5 1 1 6 0 9 4 3 3 0 5 7 2 7 0 3 6 5 7 5 9 5 9 1 9 5 3 0 9 2 1 8 6 1 1 7 3 8 1 9 3 2 6 1 1 7 9 3 1 0 5 1 1 8 5 4 8 0 7 4 4 6 2 3 7 9 9 6 2 7 4 9 5 6 7 3 5 1 8 8 5 7 5 2 7 2 4 8 9 1 2 2 7 9 3 8 1 8 3 0 1 1 9 4 9 1 2];

pi_zseven= mod(pi,7);
for i = 1:length(pi)
    if pi_zseven(i) == 0
        pi_converted(i) = 60;
    elseif pi_zseven(i) == 1
        pi_converted(i) = 62;
    elseif pi_zseven(i) == 2
        pi_converted(i) = 64;
    elseif pi_zseven(i) == 3
        pi_converted(i) = 65;       
    elseif pi_zseven(i) == 4
        pi_converted(i) = 67;          
    elseif pi_zseven(i) == 5
        pi_converted(i) = 69;          
    else
        pi_converted(i) = 71;          
    end
end

pi_converted = pi_converted';
M(:,3) = pi_converted;

M(:,4) = round(linspace(80,120,N))';  % lets have volume ramp up 80->120
M(:,5) = (0:.5:250)';  % note on:  notes start every .5 seconds
M(:,6) = M(:,5) + .5;   % note off: each note has duration .5 seconds

midi_new = matrix2midi(M);
writemidi(midi_new, 'pi.mid');
