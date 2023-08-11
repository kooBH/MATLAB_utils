close all;
clear;

default_dir = '';


dir_in = uigetdir(default_dir,'입력 폴더를 선택하세요'); %gets directory
dir_out = uigetdir(default_dir,'출력 폴더를 선택하세요');
target_fs = 16000;


myFiles = dir(fullfile(dir_in,'*.wav')); %gets all wav files in struct

for k = 1:length(myFiles)
  baseFileName = myFiles(k).name;
  fullFileName = fullfile(dir_in, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  [x, fs] = audioread(fullFileName);
  % all of your actions for filtering and plotting go here

  y = resample(x,target_fs,fs);
  audiowrite([dir_out '/'  baseFileName ],y,target_fs);
end