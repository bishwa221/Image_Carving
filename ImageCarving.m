function Ic = ImageCarving(N)

% N: number of vertical seams we have to remove


% read image
I = im2double(imread('waterfall.png'));

% get grayscale image
Ig0 = rgb2gray(im2double(I));

% colored image 
Ic = I; 


for iIter = 1:N

    Ig = rgb2gray(Ic);
    Gx = imfilter(Ig,.5*[-1 0 1],'replicate');
    Gy = imfilter(Ig,.5*[-1 0 1]','replicate');
    E = abs(Gx) +  abs(Gy); % energy
    
    
    M = zeros(size(Ig)); % cumulative energy%value matrix
    
    % CODE starts here
    P = zeros(size(Ig));%path matrix
    M(1,:) = E(1,:);
    [re,ce] = size(E);
    for i = 2:re
        for j = 1:ce
            if j == 1 %for first column path comes from top or right
                [min_val,id] = min([M(i-1,j),M(i-1,j+1)]) ;
                M(i,j) = min_val + E(i,j);
                if id == 1 % if min of M is M(i-1,j) then path lies just sbove
                    P(i,j) = 0;
                elseif id == 2
                    P(i,j) = 1;
                end
             
                
            elseif j == ce %for last column path comes from either left or top
                [min_val,id] = min([M(i-1,j-1),M(i-1,j)]);
                M(i,j) = min_val + E(i,j);
                if id == 1
                    P(i,j) = -1;
                elseif id == 2
                    P(i,j) = 0;
                end
                
                
            else
                [min_val,id] = min([M(i-1,j-1),M(i-1,j),M(i-1,j+1)]); 
                M(i,j) = min_val + E(i,j);
                if id == 1
                    P(i,j) = -1;
                elseif id == 2
                    P(i,j) = 0;
                elseif id == 3
                    P(i,j) = 1;
                end
            end
             
        end
    end
[min_last_p,idp] = min(P(end,:));
[rc,cc,hc] = size(Ic);
Ic2 = zeros(rc,cc-1,hc);
nl = [rc,idp];
%Ic(end,idp,:) = 0;
rec_vect = zeros(1,cc-1,hc);

for k = re:-1:1
    a = nl(1);
    b= nl(2);
    Ic(a,b,:) = 0;
    q = b-1;
    w = b+1;
    for g = 1:hc
       rec_vect(1,1:q,g) = Ic(a,1:q,g);
       rec_vect(1,b:end,g) = Ic(a,w:end,g);
    end
    
   Ic2(a,:,:) = rec_vect;
    if k>1
        %find another node in the path of just deleted one
        marker = P(nl(1),nl(2));%-1,0,1
        if marker  == -1
            nl = [nl(1)-1,nl(2)-1];
        elseif marker == 0
            nl = [nl(1)-1,nl(2)];
        elseif marker  == 1
            nl = [nl(1)-1,nl(2)+1];
        end
    end
end
Ic = Ic2;
    % your CODE ends here


end


figure(1),imshow(I);
figure(2),imshow(Ic);


end
