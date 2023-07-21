import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = DatabaseHelper.internal();
  static Database? _db;
  
  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  Future<Database> get db async {
    return _db ??= await initDb();
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, "data.db");
    
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {

        String sql = """
        CREATE TABLE user(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name VARCHAR NOT NULL,
          email VARCHAR NOT NULL,
          password VARCHAR NOT NULL
        );
        """;
        await db.execute(sql);

        sql="INSERT INTO user(id, name, email, password) VALUES(${0},'adm','adm','123');";
        await db.rawInsert(sql);

        sql = """
        CREATE TABLE genre(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name VARCHAR NOT NULL
        );
        """;
        await db.execute(sql);

        sql="INSERT INTO genre(name) VALUES('Comedia');";
        await db.rawInsert(sql);
        sql="INSERT INTO genre(name) VALUES('Terror');";
        await db.rawInsert(sql);
        sql="INSERT INTO genre(name) VALUES('Aventura');";
        await db.rawInsert(sql);
        sql="INSERT INTO genre(name) VALUES('Suspense');";
        await db.rawInsert(sql);
        sql="INSERT INTO genre(name) VALUES('Ação');";
        await db.rawInsert(sql);

        
        sql = """
        CREATE TABLE video(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          userid INTEGER NOT NULL,
          name VARCHAR(2) NOT NULL,
          description TEXT NOT NULL,
	        type INTEGER NOT NULL,
	        ageRestriction VARCHAR NOT NULL,
	        durationMinutes INTEGER NOT NULL,
	        thumbnailImageId VARCHAR NOT NULL,
	        releaseDate TEXT NOT NULL,
          FOREIGN KEY(userid) REFERENCES user(id)
        );
        """;
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"As branquelas", "Dois irmãos agentes do FBI, Marcus e Kevin Copeland, acidentalmente evitam que bandidos sejam presos em uma apreensão de drogas. Como castigo, eles são forçados a escoltar um par de socialites nos Hamptons. Quando as meninas descobrem o plano da agência, elas se recusam a ir. Sem opções, Marcus e Kevin, dois homens negros, decidem fingir que são as irmãs e se transformam em um par de loiras.", 0, "12", 109, "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/bb73c913cae027a8d4b2f81e076b70c7b07dcee75d686417c5dd032dc773210c._RI_TTW_.jpg", "27/08/2004");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Gente Grande", "A morte do treinador de basquete de infância de velhos amigos reúne a turma no mesmo lugar que celebraram um campeonato anos atrás. Os amigos, acompanhados de suas esposas e filhos, descobrem que idade não significa o mesmo que maturidade.", 0, "12", 102, "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcS3KC5CYzKSIx0aKLEL-lYfeeF7lfTqcd4nVGWOwO2IZaBzfdaz", "24/09/2010");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Debi & Loide - Dois Idiotas em Apuros", "Dois amigos debilóides vão para Aspen, no estado do Colorado para tentar devolver uma maleta esquecida pela passageira da limusine que um deles estava dirigindo para o aeroporto. Sem saber que na mala havia uma quantia enorme de dinheiro, que serviria para pagar o resgate de um sequestro, os dois acabam sendo perseguidos pela polícia e por assassinos profissionais.", 0, "12", 107, "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSKCcPZsWp_hL8ZVSuRkYohRC6jCr1uJjfzf7OGbcEbsHjCl4nO", "27/02/1995");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Vovó... Zona", "Agente durão do FBI chega ao extremo para ficar na pista de um ladrão violento que fugiu da prisão. Enquanto se disfarça de avó obesa com uma língua afiada, ele é forçado a usar todas as suas habilidades, desde cozinhar a cuidar de crianças.", 0, "12", 99, "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQs8hhrXjeR7CBIQoRIeJuDpeXkpHSEQnySAnYYQ0HF9A-nBTGF", "31/05/2000");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"O Massacre da Serra Elétrica", "No caminho para visitar o túmulo de seu avô, cinco jovens se perdem e mergulham em um pesadelo sem fim quando conhecem uma família de canibais. Os psicopatas atacam os forasteiros utilizando uma variedade de métodos brutais e sádicos.", 0, "18", 83, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStIuVC5f5UgfMf5ZlSjd7nQa-4SFqv_hocQgRnm8MI1HfzU43W", "28/08/1987");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Pânico", "Um grupo de jovens enfrenta um assassino mascarado que testa seus conhecimentos sobre filmes de terror. A pequena cidade de Woodsboro nunca mais será a mesma.", 0, "15", 111, "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQgmDJZmjF4dYJCurXMxHic6tAln_1PPlvBmQWjtwt3rkF4EVPY", "31/01/1997");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Halloween - A Noite do Terror", "Em 1963, durante uma noite fria de Halloween, o pequeno Michael Myers, de seis anos, assassina brutalmente sua irmã adolescente, Judith. Ele é condenado e fica detido por 15 anos em uma instituição sob vigilância constante do Dr. Sam Loomis. Em 1978, na véspera de Halloween, Michael rouba um carro e escapa do sanatório Smith's Grove. Ele retorna à sua pacata cidade natal de Haddonfield, Illinois, onde procura suas próximas vítimas.", 0, "16", 91, "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcS616wS-im7oz53cdUwG7EooP4ZnRDR3Z0xPEp4scoZzMUDu8je", "25/10/1978");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Madrugada dos Mortos", "Depois que um mal transforma a maior parte da humanidade em zumbis sedentos de sangue, um pequeno grupo de sobreviventes encontra refúgio em um shopping center. É apenas uma questão de tempo até que os mortos-vivos cheguem, e a comida está acabando. Quando a eletricidade é cortada, o grupo precisa encontrar uma maneira de escapar das centenas de zumbis que tomam conta das ruas.", 0, "18", 100, "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ0hwmARn23COwlTeKVqktdqWSBODG6vyoXRvveY4OhlgsNEFd-", "19/03/2004");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Peter Pan", "Wendy Darling, uma jovem com medo de deixar sua casa de infância para trás, conhece Peter Pan, um menino que se recusa a crescer. Com seus irmãos e uma fada, Tinker Bell, ela viaja com Peter para o mundo mágico da Terra do Nunca. Lá, ela encontra um pirata perverso chamado Capitão Gancho, e embarca em uma aventura emocionante que vai mudar sua vida para sempre.", 0, "10", 109, "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTc1tGUBLrL2AZdqSHEFFAAkYvXRVO8uoyfy6Ui_lzH2bbn6JNK", "28/04/2023");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Avatar", "No exuberante mundo alienígena de Pandora vivem os Na'vi, seres que parecem ser primitivos, mas são altamente evoluídos. Como o ambiente do planeta é tóxico, foram criados os avatares, corpos biológicos controlados pela mente humana que se movimentam livremente em Pandora. Jake Sully, um ex-fuzileiro naval paralítico, volta a andar através de um avatar e se apaixona por uma Na'vi. Esta paixão leva Jake a lutar pela sobrevivência de Pandora.", 0, "12", 162, "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ7rmBAddxPiH2VMLjKJImUIaFminFtY8Fdf9dDVEimsuaZ67Is", "18/12/2009");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"A Ilha da Fantasia", "Uma ilha mágica no Oceano Pacífico oferece aos visitantes a possibilidade de realizar sonhos e viver aventuras que parecem impossíveis em outro lugar. Porém, como avisa o anfitrião, Sr. Roarke, realizar desejos pode não acontecer da maneira esperada.", 0, "14", 109, "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcS2CAnecA-5AL-DH33XUJrRc9qHuogfYwJ-_WES99qoLkPCY30N", "13/02/2020");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"A Era do Gelo", "Vinte mil anos atrás, num mundo coberto de gelo, o mamute Manfred e a preguiça Sid resgatam um bebê humano órfão. Agora, os dois vão enfrentar muitas aventuras até devolver o filhote de gente à sua tribo, que migrou para um novo acampamento.", 0, "Livre", 81, "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRYtVDwV__Xgl4VVhQUcl4dtDYsso2QKz3Qrl9exMrmL5y-ARQN", "22/03/2002");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"A Queda", "Para as melhores amigas Becky e Hunter, a vida é sobre vencer medos e ultrapassar limites. No entanto, depois de subir 600 metros até o topo de uma torre de rádio remota e abandonada, elas acabam presas lá em cima. Agora, suas habilidades de escalada são colocadas à prova enquanto lutam desesperadamente para sobreviver aos elementos, a falta de suprimentos e a altura vertiginosa.", 0, "14", 107, "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcThhjAv6Y9BKKrJyczESuQQwW7MSBJbWuWtUiN3e5MgEv5op-ZF", "29/09/2022");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Tempo", "Uma família decide se divertir em uma praia e se vê envolvida em um mistério sinistro. O tempo parece passar de forma diferente no lugar, fazendo com que eles envelheçam anos em alguns minutos.", 0, "14", 108, "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSGDCRReJuekzG1VVDQZzuDYDhUSOSGBwyi7SzluDXZ-h6sZmzK", "22/07/2021");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"O Telefone Preto", "Finney Shaw, de 13 anos, é sequestrado por um sádico assassino mascarado e mantido em um porão à prova de som. Até que um telefone desconectado na parede começa a tocar, e ele logo descobre que pode ouvir as vozes das vítimas anteriores do maníaco.", 0, "16", 102, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWVoDZxHuH5V7B3hOAnNAjzEE93Xf6yPoOGH3XuqN-btkjMOhj", "21/07/2022");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Fuja", "Após anos vivendo isolada do mundo e sendo cuidada por sua rígida mãe, Chloe começa a desconfiar que há algo extremamente errado em sua vida.", 0, "16", 90, "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTo1UPuu2vSGUZBbWPj-sD46WF5VRKsFBKDzlxYrG2HnAyE_AD7", "13/04/2020");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Resgate", "Em Bangladesh, o mercenário do mercado negro Tyler Rake luta para sobreviver durante a missão para resgatar o filho sequestrado de um chefe do crime internacional.", 0, "16", 116, "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR95MAPzBughCgAlraSwHpwlNnd_jPf1aMJxhVZd-V4d37gX4q0", "24/04/2020");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Velozes e Furiosos", "Brian O'Conner é um policial que se infiltra no submundo dos rachas de rua para investigar uma série de furtos. Enquanto tenta ganhar o respeito e a confiança do líder Dom Toretto, ele corre o risco de ser desmascarado.", 0, "12", 106, "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSRzqY49FGdOAUVxHf6h0qXBw5CNwKiDMkXhdW0hFAxVS7hzf5F", "28/09/2001");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Uncharted: Fora do Mapa", "Nathan Drake e seu parceiro canastrão Victor 'Sully' Sullivan embarcam em uma perigosa busca para encontrar o maior tesouro jamais encontrado. Enquanto isso, eles também rastreiam pistas que podem levar ao irmão perdido de Nathan.", 0, "12", 116, "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRdhVox6HMHdojYOTphlniAHlDWeE96wYrQZUnlDOaOU5iY_K90", "17/02/2022");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(${0},"Alerta Vermelho", "Um alerta vermelho da Interpol é emitido e o agente do FBI John Hartley assume o caso. Durante sua busca, ele se vê diante de um assalto ousado e é forçado a se aliar ao maior ladrão de arte da história, Nolan Booth, para capturar a ladra de arte mais procurada do mundo atualmente, Sarah Black.", 0, "12", 118, "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSxp1zGpRgnhx04mCdkDOlbu-FGTrgvK3SDNie8_ybDtKYb-sXo", "04/11/2021");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"Sex Education", "O inexperiente Otis entede tudo de aconselhamento sexual, graças à sua mãe sexóloga. Ele se junta com a rebelde Maeve para abrir uma clínica de terapia sexual na escola.", 1, "16", "4","https://br.web.img3.acsta.net/pictures/19/01/03/10/55/2296345.jpg", "11/01/2019");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"The Office", "Esta adaptação americana se passa em uma empresa de papel em Scranton, Pensilvânia e tem um estilo de documentário semelhante ao original britânico estrelado por Ricky Gervais. Mostra a equipe da Dunder-Mifflin, que inclui personagens baseados no original britânico (e, provavelmente, em pessoas com quem você trabalha em seu escritório). Temos Jim, o simpático empregado que tem um pouco de todo homem. Jim sente uma atração pela recepcionista promovida a representante de vendas Pam (pois romances de escritório são sempre uma boa ideia). Temos também Dwight, o colega de trabalho bem-sucedido que carece de habilidades sociais e bom senso. E há ainda Ryan, ex-estagiário que trabalha temporariamente na matriz em Nova York antes de retornar a Scranton.", 1, "12", "9", "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSPKWRfp8IHwONwwh6RGXQOv30KS5sA4i1nLQs96SVU1x65IC2J", "24/03/2005");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"Big Bang: A Teoria", "Os melhores amigos e companheiros de apartamento Leonard e Sheldon são físicos que trabalham no Instituto Tecnológico da Califórnia (Caltech) e são capazes de explicar a todo mundo mais do que gostariam de saber sobre física quântica, mas superar as situações sociais mais básicas, especialmente aquelas envolvendo mulheres, os deixa completamente perdidos. Que sorte quando a gostosa garçonete/atriz aspirante Penny se muda para o apartamento ao lado. Wolowitz e Koothrappali, também da Caltech, são vistos frequentemente passando o tempo com Leonard e Sheldon. Será que os mundos vão se colidir? Será que Einstein teorizava na floresta?", 1, "12", "12", "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRiNsZ90JifevpSLJkTM3F5oNVGlVv83lJJGwWAQgiV9oahJfE8", "16/05/2019");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"iCarly", "Carly Shay tem sua vida radicalmente mudada quando seu programa na internet torna-se um sucesso entre os jovens. Como seus pais estão viajando, Carly precisa contar com a ajuda de seu irmão e amigos para administrar sua recente fama.", 1, "10", "6", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShmeHMuZQ1yeEqmF0T9ThSU6hX0qRkVA2zDxwR852nwKIttuwe", "08/09/2007");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"The Last of Us", "Joel, um sobrevivente duro e cínico, e a jovem e impetuosa Ellie se conectam pela dificuldade do mundo em que vivem. Juntos, eles enfrentam circunstâncias brutais e monstros impiedosos durante uma difícil jornada pelos EUA após um surto apocalíptico.", 1, "18", "1", "https://i.em.com.br/1WyztEPsqHfsfaIcE3EiGQwaPUI=/1200x720/smart/imgsapp.em.com.br/app/noticia_127983242361/2023/03/03/1464315/the-last-of-us_1_165413.jpg", "15/01/2023");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"All of Us Are Dead", "Uma epidemia mortal surge em uma escola. Encurralados, os alunos só tem uma opção: lutar com todas as forças para não virarem zumbis.", 1, "18", "2", "https://upload.wikimedia.org/wikipedia/en/2/24/All_of_Us_Are_Dead.jpeg", "28/01/2022");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"Black Mirror", "Contos de ficção científica que refletem o lado negro das telas e da tecnologia, mostrando que nem toda novidade traz só benefícios.", 1, "18", "6", "https://img.olhardigital.com.br/wp-content/uploads/2023/06/Black-Mirror.png", "04/12/2011");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"Scream / Pânico: A Série de TV", "Grupo de jovens se torna alvo de um assassino mascarado.", 1, "16", "3", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8F-xNOQpDXwt-zHBaFi5l6Bn_cSRhoBYzCfp3Ikk7xRuCDzeu", "30/06/2015");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"Game of Thrones", "Sucesso entre os livros mais vendidos, a série de obras 'A Song of Ice and Fire', de George R.R. Martin, é levada à tela quando HBO decide navegar a fundo pelo gênero e recriar a fantasia medieval épica. Este é o retrato de duas famílias poderosas - reis e rainhas, cavaleiros e renegados, homens honestos e mentirosos - disputando um jogo mortal pelo controle dos Sete Reinos de Westeros para assumir o Trono de Ferro. A série foi filmada em Malta e no norte da Irlanda, tendo participação do escritor dos livros.", 1, "18", "8", "https://m.media-amazon.com/images/I/91iY86ZIuOL._AC_UF894,1000_QL80_.jpg", "19/05/2019");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"Sobrenatural", "Os irmãos Sam e Dean Winchester encaram cenários sinistros caçando monstros. Velhos truques, armas e esconderijos não funcionam mais e seus amigos os traem, forçando os irmãos a contar um com o outro enquanto enfrentam novos inimigos.", 1, "12", "15", "https://m.media-amazon.com/images/I/91vVs1-bdkS._AC_UF894,1000_QL80_.jpg", "13/09/2005");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"She-Hulk", "Jennifer Walters tem uma vida complicada, pois além de advogada, solteira de 30 e poucos anos, é também um hulk superpoderoso.", 1, "14", "1", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfytHTFyc0YUzgkn6EYA_u9at5FazZFZfzJiSOzeFACbrpPyIA", "18/08/2022");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"The Flash", "Acompanhe as aventuras do homem mais veloz do planeta, o cientista da Central City Police Barry Allen, que após um trágico acidente adquire o poder da velocidade.", 1, "13", "9", "https://m.media-amazon.com/images/M/MV5BZDcwMzU4NWYtODIzZi00Yzg4LWJhOTAtOTQ2ZDA4NmFlYmFlXkEyXkFqcGdeQXVyMTY1MTU3NDY5._V1_FMjpg_UX1000_.jpg", "07/10/2014");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"Bem-vindos ao Éden", "Um grupo de jovens vai a uma festa em uma ilha paradisíaca, mas acaba vivendo um inferno cheio de segredos, perigos e armadilhas.", 1, "16", "2", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa8MwcYiCQNqygApSIOtPu2VZO_PGbq4KDqerY3NphnI-_2K5n", "06/052022");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"Bem-Vindos à Vizinhança", "Cartas sinistras. Vizinhos estranhos. Ameaças obscuras. Uma família se muda para sua casa dos sonhos, mas logo descobre que herdou um pesadelo.", 1, "16", "1", "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQPqrWoPXlqcb9Zw2brjs21jhUkoFim4mDyOl2cgkZwmb_rtKCq", "13/10/2022");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"Dark", "Os mistérios sombrios de uma pequena cidade alemã são expostos quando duas crianças desaparecem. Enquanto as famílias procuram os dois desaparecidos, eles descobrem uma trama de indivíduos conectados com a história conturbada da cidade.", 1, "16", "3", "https://resizing.flixster.com/lpJkDxnEFNQT1OWJjnmYfvpAHJ0=/ems.cHJkLWVtcy1hc3NldHMvdHZzZXJpZXMvUlRUVjI2NjgyOS53ZWJw", "27/06/2020");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"Sherlock", "Sherlock Holmes sempre foi um homem moderno, o mundo é que envelheceu. Agora ele está de volta como sempre foi: nervoso, contemporâneo, difícil e perigoso, apresentado de um jeito novo, moderno.", 1, "14", "2", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr-CCt-cdDFdStocPoV80lMwaeAZeMrMMTXRayvVXJaEVwAual", "25/07/2010");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"Arcane", "Em meio ao conflito entre as cidades-gêmeas de Piltover e Zaun, duas irmãs lutam em lados opostos de uma guerra entre tecnologias mágicas e convicções incompatíveis.", 1, "14", "1", "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQw9ZZQVJqnze9k8r6c5xUeFSc9iBNtiY2nuQd_N1qWAQ6javhR", "06/11/2021");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"The Boys", "A Terra é habitada por super-heróis que são um inspiração para a humanidade. Porém, esses protetores têm um lado sinistro que a maioria das pessoas desconhece. Se eles usam seus poderes para o mal, Hughie, Billy e o resto do time devem detê-los.", 1, "18", "3", "https://br.web.img3.acsta.net/pictures/19/07/09/14/34/1532536.jpg?coixp=57&coiyp=52", "26/07/2019");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"One Piece", "One Piece é uma futura uma série de streaming live-action, baseada nas séries de mangá do mesmo título, está atualmente em desenvolvimento para o serviço de streaming Netflix que está envolvido na produção ao lado da empresa americana Tomorrow Studios.", 1, "14", "1", "https://noticiasdatv.uol.com.br/media/_versions/artigos_2021/one-piece-luffy-live-action_fixed_large.jpg", "31/08/2023");""";
        await db.execute(sql);

        sql = """INSERT INTO video(userid, name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate)VALUES(${0},"Alice in Borderland", "Um gamer e dois amigos são transportados para uma versão paralela de Tóquio, onde precisam participar de diversos jogos mortais caso queiram sobreviver.", 1, "18", "2", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7bNhpTIID9flag4wQK78f4TG_RGOrPrjlYGAPZeFqJhgn5g5j", "10/12/2020");""";
        await db.execute(sql);

        sql = """
        CREATE TABLE video_genre(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          videoid INTEGER NOT NULL,
	        genreid INTEGER NOT NULL,
	        FOREIGN KEY(videoid) REFERENCES video(id),
	        FOREIGN KEY(genreid) REFERENCES genre(id)
        );
        """;
        await db.execute(sql);

        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(1, 1);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(2, 1);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(3, 1);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(4, 1);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(5, 2);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(6, 2);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(7, 2);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(8, 2);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(9, 3);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(10, 3);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(11, 3);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(12, 3);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(13, 4);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(14, 4);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(15, 4);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(16, 4);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(17, 5);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(18, 5);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(19, 5);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(20, 5);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(21, 1);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(22, 1);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(23, 1);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(24, 1);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(25, 2);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(26, 2);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(27, 2);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(28, 2);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(29, 3);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(30, 3);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(31, 3);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(32, 3);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(33, 4);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(34, 4);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(35, 4);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(36, 4);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(37, 5);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(38, 5);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(39, 5);";
        await db.execute(sql);
        sql = "INSERT INTO video_genre(videoid, genreid) VALUES(40, 5);";
        await db.execute(sql);
      }
    );
    return db;
  }
}