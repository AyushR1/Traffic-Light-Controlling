
%image input
path1_ref=imread('ref_1.png');
path1_cap=imread('cap_1.png');
path2_ref=imread('ref_2.png');
path2_cap=imread('cap_2.png');
path3_ref=imread('ref_3.png');
path3_cap=imread('cap_3.png');

%conversion to grayscale
path1_ref_g=rgb2gray(path1_ref);
path1_cap_g=rgb2gray(path1_cap);
path2_ref_g=rgb2gray(path2_ref);
path2_cap_g=rgb2gray(path2_cap);
path3_ref_g=rgb2gray(path3_ref);
path3_cap_g=rgb2gray(path3_cap);

%image resize
path1_ref_resize=imresize(path1_ref_g,[700 700]);
path1_cap_resize=imresize(path1_cap_g,[700 700]);
path2_ref_resize=imresize(path2_ref_g,[700 700]);
path2_cap_resize=imresize(path2_cap_g,[700 700]);
path3_ref_resize=imresize(path3_ref_g,[700 700]);
path3_cap_resize=imresize(path3_cap_g,[700 700]);

%edge detection
path1_ref_edge=edge(path1_ref_resize);
path1_cap_edge=edge(path1_cap_resize);
path2_ref_edge=edge(path2_ref_resize);
path2_cap_edge=edge(path2_cap_resize);
path3_ref_edge=edge(path3_ref_resize);
path3_cap_edge=edge(path3_cap_resize);

%Show the images
%figure,imshow(path1_ref_edge);
%figure,imshow(path1_cap_edge);
%figure,imshow(path2_ref_edge);
%figure,imshow(path2_cap_edge);
%figure,imshow(path3_ref_edge);
%figure,imshow(path3_cap_edge);


%%street 1
%count edges in referecnce 
total_1=0;
for a=1:1:700
 for b=1:1:700
 if(path1_ref_edge(a,b)==1)
 total_1=total_1+1;
 end
 end
end

%compare with captured
m=0;
for i=1:1:700
 for j=1:1:700
 if(path1_ref_edge(i,j)==1)&(path1_cap_edge(i,j)==1)
 m=m+1;
 end
 end
end

%finding match % for street 1
total_match_1=(m/total_1)*100;

%%street 2
%count edges in referecnce 
total_2=0;
for a=1:1:700
 for b=1:1:700
 if(path2_ref_edge(a,b)==1)
 total_2=total_2+1;
 end
 end
end

%compare with captured
m2=0;
for i=1:1:700
 for j=1:1:700
 if(path2_ref_edge(i,j)==1)&(path2_cap_edge(i,j)==1)
 m2=m2+1;
 end
 end
end

%finding match % for street 2
total_match_2=(m2/total_2)*100;

%%street 3
%count edges in referecnce 
total_3=0;
for a=1:1:700
 for b=1:1:700
 if(path3_ref_edge(a,b)==1)
 total_3=total_3+1;
 end
 end
end

%compare with captured
m3=0;
for i=1:1:700
 for j=1:1:700
 if(path3_ref_edge(i,j)==1)&(path3_cap_edge(i,j)==1)
 m3=m3+1;
 end
 end
end

%finding match % for street 3
total_match_3=(m3/total_3)*100;


%comparison of matching % to find the most traffic congested street
if(total_match_1<=total_match_2)&(total_match_1<=total_match_3)&(total_match_2<=total_match_3)
 ans=[1,2,3]
end
if(total_match_1<=total_match_2)&(total_match_1<=total_match_3)&(total_match_3<=total_match_2)
 ans=[1,3,2]
end
if(total_match_2<=total_match_1)&(total_match_2<=total_match_3)&(total_match_1<=total_match_3)
 ans=[2,1,3]
end
if(total_match_2<=total_match_1)&(total_match_2<=total_match_3)&(total_match_3<=total_match_1)
 ans=[2,3,1]
end
if(total_match_3<=total_match_1)&(total_match_3<=total_match_2)&(total_match_1<=total_match_2)
 ans=[3,1,2]
end
if(total_match_3<=total_match_1)&(total_match_3<=total_match_2)&(total_match_2<=total_match_1)
 ans=[3,2,1]
end
