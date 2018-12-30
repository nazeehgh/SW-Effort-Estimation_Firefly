function crossvalidation(data);
%load fisheriris 
%indices = crossvalind('Kfold',data(:,1),9);
%cp = classperf(data(:,1));




for i = 1:9
    train=ones(1,9);
    train(i)=0;
    train=transpose(train);
    Reducedtraining=bsxfun(@times,train,data);
   % b = Reducedtraining(find(Reducedtraining~=0));
    
   
    % extract nonxero elements in training set
     TF = Reducedtraining==0;
     TFrow = ~all(TF,2);
     Reducedtraining=Reducedtraining(TFrow,:)
    
    test=~train;
      %  test=transpose(test)
    Reducedtesting=bsxfun(@times,test,data);

    % extract nonxero elements in testing set
     TF = Reducedtesting==0;
     TFrow = ~all(TF,2);
     Reducedtesting=Reducedtesting(TFrow,:)
    
end
%cp.ErrorRate;
