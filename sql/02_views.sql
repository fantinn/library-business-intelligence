CREATE VIEW vwLivroPreco AS
SELECT
  l.IdLivro,
  l.NomeLivro,
  l.PrecoLivro,
  l.NumeroPaginas,
  a.NomeAssunto,
  e.NomeEditora
FROM Livro l
JOIN Assunto a ON l.IdAssunto = a.IdAssunto
JOIN Editora e ON l.IdEditora = e.IdEditora;

CREATE VIEW vwPrecoEditora AS
SELECT
  e.NomeEditora,
  AVG(l.PrecoLivro) AS PrecoMedio
FROM Livro l
JOIN Editora e ON l.IdEditora = e.IdEditora
GROUP BY e.NomeEditora;
