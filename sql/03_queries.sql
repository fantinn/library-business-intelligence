-- Preço médio por editora
SELECT
  e.NomeEditora,
  AVG(l.PrecoLivro) AS MediaPreco
FROM Livro l
JOIN Editora e ON e.IdEditora = l.IdEditora
GROUP BY e.NomeEditora;

-- Quantidade de livros por assunto
SELECT
  a.NomeAssunto,
  COUNT(*) AS TotalLivros
FROM Livro l
JOIN Assunto a ON a.IdAssunto = l.IdAssunto
GROUP BY a.NomeAssunto;

-- Top 3 livros mais caros por assunto
SELECT *
FROM (
  SELECT
    a.NomeAssunto,
    l.NomeLivro,
    l.PrecoLivro,
    ROW_NUMBER() OVER (
      PARTITION BY a.NomeAssunto
      ORDER BY l.PrecoLivro DESC
    ) AS rn
  FROM Livro l
  JOIN Assunto a ON a.IdAssunto = l.IdAssunto
) t
WHERE rn <= 3;
