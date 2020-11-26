[data_test,~,~] =  id3_preprocess(2);
[length_testx,length_testy] = size(data_test);
data_2 = data_test(:,1:length_testy-1);
expect_result = data_test(:,length_testy); 
non_decision = 0;
flag = zeros(length_testx,2);
flag_two = 0;
for i = 1:(length_testx-1)
    for ii = i+1:length_testx
        if sum( data_2(i,:) == data_2(ii,:)) == 0
            flag_two
            flag_two = flag_two + 1;
            if expect_result(i,1) ~= expect_result(ii,1)
                non_decision = non_decision + 1;
                flag(non_decision,1) = i;
                flag(non_decision,2) = ii;
            end
        end
    end % for ii
end %for i