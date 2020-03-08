% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
	% TODO graphical representation coded here
  % nr de centroizi
  L = length(centroids(:,1));
  %nr punctelor
  veclen = length(points(:,1));
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
  indmat = indmat';
  % ce am facut la task 2,plus comanda de sub care va pune o culoare
  % random fiecarul cluster. Am avut nevoie de indmat de la 2 pt a sti
  % carui cluster apartine fiecarui punct
  scatter3(points(:,1),points(:,2),points(:,3),[],indmat);
end


