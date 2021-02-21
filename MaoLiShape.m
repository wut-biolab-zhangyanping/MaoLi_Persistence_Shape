
% load dataset
[train_img_path, train_label,val_img_path, val_label, test_img_path, test_label] = getImageList();
% load dataset end
%file=dir('*.jpg'); % change the format of image here.
clear EC
pCnt = 20;
img_path_list = val_img_path;
delta = ceil(length(img_path_list) / pCnt);
p_img_list = cell(pCnt, 1);
p_img_list{1} = img_path_list(1 : delta);
for i = 2:pCnt
    if i*delta > length(img_path_list)
        p_img_list{i} = img_path_list((i-1)*delta+1 : length(img_path_list));
    else
        p_img_list{i} = img_path_list((i-1)*delta+1 : i*delta);
    end
end
EC = cell(pCnt, 1);
parfor p=1:pCnt
    res = extract_tp_features(p_img_list{p});
    EC{p} = res;
end
% EC_Cherry = [];
% for i = 1 : 20
%     EC_Cherry = [EC_Cherry; EC{i}];
% end
file_name = ['EC-cherry-val','.mat'];
save(string(file_name), 'EC','-v7.3');


