% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
	cost = 0; 
	% TODO compute clustering solution cost
  % nr de centroizi
  L = length(centroids(:,1));
  veclen = length(points(:,1)); %53
  indmat=zeros(1,veclen);
  for i = 1 : 1 : veclen
    l = 1;
    % pt a lua toate liniile
    alllines = points(i,:);
    mindistance = sum((alllines - centroids(1,:)) .^ 2);
    for j = 1 : 1 : L
      centrlines = centroids(j,:);
      distance = sum((alllines - centrlines) .^ 2);
      if (mindistance > distance)
        mindistance = distance;
        l = j;
      endif
    end
    indmat(i) = l;
  end
  %Ce am facut la 2,plus formula prin care calculam costul unui cluster
  for i=1:veclen
    cost+=norm(points(i,:)-centroids(indmat(i),:));
  endfor
  disp(cost);
end

