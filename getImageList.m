function [train_img_path, train_label, test_img_path, test_label] = getImageList()
        [train_img_list, train_y_list] = importfile('/home/zyp/MFCIS/train_and_test_file/cherry_train_file_0_not_aug.csv');
        [val_img_list, val_y_list] = importfile('/home/zyp/MFCIS/train_and_test_file/cherry_val_file_list_0.csv');
        [test_img_list, test_y_list] = importfile('/home/zyp/MFCIS/train_and_test_file/cherry_test_file_0.csv');
        train_img_file = train_img_list;
        train_y = train_y_list;
        [class, label] = importMapFile('/home/zyp/MFCIS/cherry_id.txt');
        for i = 1:length(train_y)
            for j = 1:length(class)
                if train_y(i) == class(j)
                    train_y(i) = label(j);
                end
            end
        end
        for i = 1:length(test_y_list)
            for j = 1:length(class)
                if test_y_list(i) == class(j)
                    test_y_list(i) = label(j);
                end
            end
        end
       train_img_path = train_img_file;
       train_label = train_y;
       test_img_path = test_img_list;
       test_label = test_y_list;
end

