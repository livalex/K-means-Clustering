function view_cost_vs_nc(file_points)
	% TODO compute cost for NC = [1..10] and plot
  points = [];
  % citim punctele din input
  points = dlmread(file_points, ' ', 5, 0);
  cost=[];
  NC = 1;
  while (NC <= 10)
    centroids = clustering_pc(points, NC);
    costs(NC) = compute_cost_pc(points,centroids);
    NC++;
  endwhile
  % Trasam graficul dupa ce am calculat centroizii si costul clusterelor
  % cu functiile anterioare.
  plot(1:10,costs(:));
end

