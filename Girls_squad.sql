select Title, POPULARITY, `IMDb Score`, `Rotten Tomatoes Score`, `Metacritic Score`
from show_perf, shows
where show_perf.IMDB_ID = shows.IMDB_ID
order by show_perf.POPULARITY desc limit 15;

select Title, round((Boxoffice-BUDGET)/BUDGET, 0) as ROI, `Series or Movie`, Genre_name, `IMDb Score`, `Rotten Tomatoes Score`, `Metacritic Score`
from genres join show_genre_relation on genres.Genre_id = show_genre_relation.Genre_id
join shows on show_genre_relation.IMDB_ID = shows.IMDB_ID
join show_perf on show_perf.IMDB_ID = shows.IMDB_ID
group by title
order by ROI desc limit 30;
select distinct director_name, IMDBScore
from directors join show_director_relation on directors.director_id = show_director_relation.Director_id
join shows on show_director_relation.IMDB_ID = shows.IMDB_ID
join show_perf on show_perf.IMDB_ID = shows.IMDB_ID
where show_perf.IMDBScore > 8
order by show_perf.IMDBScore desc

select distinct director_name, avg(boxoffice) Average_Boxoffice
from directors join show_director_relation on directors.director_id = show_director_relation.Director_id
join shows on show_director_relation.IMDB_ID = shows.IMDB_ID
join show_perf on show_perf.IMDB_ID = shows.IMDB_ID
where show_perf.IMDBScore > 8
group by director_name limit 15;

select title, sum(boxoffice) Boxoffice_sales, sum(AwardsReceived) Number_of_Awards,                                                                                                    sum(AwardsNominatedFor) Number_of_Nominations
from shows
join show_perf on show_perf.IMDB_ID = shows.IMDB_ID 
group by title
order by sum(Boxoffice) desc limit 15;

select g.Genre_name, s.SeriesOrMovie, count(s.IMDB_ID) as num, avg(RottenTomatoesScore) as rt_score, avg(MetacriticScore) as ms, avg(IMDbScore) as imdbs
from Netflix_Project.shows s
join Netflix_Project.show_Genre_relation sg
on s.IMDB_ID = sg.IMDB_ID
right join Netflix_Project.Genres g
on g.Genre_id = sg.Genre_id
join Netflix_Project.show_perf sp
on sp.IMDB_ID = s.IMDB_ID
group by 1,2
order by 3 desc

SELECT date_format(s.ReleaseDate, '%Y-%m') as date, count(s.IMDB_ID) as count_show, avg(sp.POPULARITY) as popularity
FROM Netflix_Project.shows s
join Netflix_Project.show_perf sp
on s.IMDB_ID = sp.IMDB_ID
where date_format(s.ReleaseDate, '%Y-%m') >= "2000-01"
group by 1
order by 1;

SELECT s.Title,s.BUDGET,sf.RottenTomatoesScore,sf.IMDbScore
FROM shows s LEFT JOIN show_perf sf ON s.IMDB_ID = sf.IMDB_ID 
WHERE s.seriesOrMovie = 'Movie' and sf.RottenTomatoesScore > 90
ORDER BY s.BUDGET DESC LIMIT 10;
