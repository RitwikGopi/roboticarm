function check(i,j,nn)
global img;
global O2;
global O1;
global C2;
global C1;
global K;
global S;
global p;


tupl = [ (0,1), (1,1), (1,0), (1,-1), (0,-1), (-1,-1), (-1,0), (-1,1)]
if nn != 1
	tupl = [tupl[nn:end],tupl[1:nn-1]]
end
if S[i,j] == 0
    S[i,j] = 1;
    if img[i,j] < 0x0f
	    #plot(X[j],Y[n1+1-i],"r.")
	    #println('"',i,',',j,'"')
	    #wait(Timer(.01));
    	    O2 = [O2 O1[i,j]];
            C2 = [C2 C1[i,j]];
	    #O2 = [O2 0.0];
	    #C2 = [C2 0.0];
	    K += 1;
	    p = p+1;
            for tup in tupl
	    	if check(i+tup[1], j+tup[2], nn) == 0 return 0;
	    	end
		if nn > 8
			nn = 1
		else
			nn += 1
		end
            end    
            #end
    end
end
return 1
end
