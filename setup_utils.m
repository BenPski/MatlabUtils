%adding the matlab_utils path to the startup.m file

%first get the startup.m location

start_file = [userpath,'/startup.m'];

%open the file in append mode, don't want to delete any other important
%startup stuff
fid = fopen(start_file,'at');

%write the correct directory to the path (it should be the directory this
%file is located in
f = mfilename('fullpath');
[dir,~,~] = fileparts(f);
fprintf(fid,'%s\n',['addpath(''',dir,''');']);

%close the file
fclose(fid);

