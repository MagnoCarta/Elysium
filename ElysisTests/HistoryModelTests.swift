//
//  HistoryModelTests.swift
//  ElysisTests
//
//  Created by Ronaldo Gomes on 20/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import XCTest
@testable import Elysis


class HistoryModelTests: XCTestCase {
    
    
    override func tearDown() {
        let gameState = GameState()
        try? FileManager.default.removeItem(at: gameState.gameStateURL)
    }
    
    func test_historyModel_getHistory_positiveNegativePositiveNeutral () {
        
        //Given
        let sut = HistoryModel()
        let expec = expectation(description: "getHistory")
        let history = getHistoryPositiveNegativePositiveNeutral()
        
        //When
        sut.getHistory(0, "Normal") { historia in
            
            //Then
            XCTAssertEqual(historia, history[0])
            
            //When
            sut.getHistory(1, "Positive") { historia in
                
                //Then
                XCTAssertEqual(historia, history[1])
                
                //When
                sut.getHistory(2, "Negative") { historia in
                    
                    //Then
                    XCTAssertEqual(historia, history[2])
                    
                    sut.getHistory(3, "Positive") { historia in
                               
                        //Then
                        XCTAssertEqual(historia, history[3])
                        
                        sut.getHistory(4, "Neutral") { historia in
                            
                            //Then
                            XCTAssertEqual(historia, history[4])
                            expec.fulfill()
                        }
                    }
                }
            }
        }
        
        wait(for: [expec], timeout: 20)
    }
    
    func test_historyModel_getHistory_positiveNegativeNegativeNeutral (){
        
        //Given
        let sut = HistoryModel()
        let expec = expectation(description: "getHistory")
        let history = getHistoryPositiveNegativeNegativeNeutral()
        
        //When
        sut.getHistory(0, "Normal") { historia in
            
            //Then
            XCTAssertEqual(historia, history[0])
            
            //When
            sut.getHistory(1, "Positive") { historia in
                
                //Then
                XCTAssertEqual(historia, history[1])
                
                //When
                sut.getHistory(2, "Negative") { historia in
                    
                    //Then
                    XCTAssertEqual(historia, history[2])
                    
                    sut.getHistory(3, "Negative") { historia in
                               
                        //Then
                        XCTAssertEqual(historia, history[3])
                        
                        sut.getHistory(4, "Neutral") { historia in
                            
                            //Then
                            XCTAssertEqual(historia, history[4])
                            expec.fulfill()
                        }
                    }
                }
            }
        }
        
        wait(for: [expec], timeout: 60)
    }
    
    func test_historyModel_getHistory_positiveNeutralPositiveNeutral (){
        
        //Given
        let sut = HistoryModel()
        let expec = expectation(description: "getHistory")
        let history = getHistoryPositiveNeutralPositiveNeutral()
        
        //When
        sut.getHistory(0, "Normal") { historia in
            
            //Then
            XCTAssertEqual(historia, history[0])
            
            //When
            sut.getHistory(1, "Positive") { historia in
                
                //Then
                XCTAssertEqual(historia, history[1])
                
                //When
                sut.getHistory(2, "Neutral") { historia in
                    
                    //Then
                    XCTAssertEqual(historia, history[2])
                    
                    sut.getHistory(3, "Positive") { historia in
                               
                        //Then
                        XCTAssertEqual(historia, history[3])
                        
                        sut.getHistory(4, "Neutral") { historia in
                            
                            //Then
                            XCTAssertEqual(historia, history[4])
                            expec.fulfill()
                        }
                    }
                }
            }
        }
        
        wait(for: [expec], timeout: 20)
    }
    
    func test_historyModel_getHistory_positiveNeutralNegativeNeutral () {
        
        //Given
        let sut = HistoryModel()
        let expec = expectation(description: "getHistory")
        let history = getHistoryPositiveNeutralNegativeNeutral()
        
        //When
        sut.getHistory(0, "Normal") { historia in
            
            //Then
            XCTAssertEqual(historia, history[0])
            
            //When
            sut.getHistory(1, "Positive") { historia in
                
                //Then
                XCTAssertEqual(historia, history[1])
                
                //When
                sut.getHistory(2, "Neutral") { historia in
                    
                    //Then
                    XCTAssertEqual(historia, history[2])
                    
                    sut.getHistory(3, "Negative") { historia in
                               
                        //Then
                        XCTAssertEqual(historia, history[3])
                        
                        sut.getHistory(4, "Neutral") { historia in
                            
                            //Then
                            XCTAssertEqual(historia, history[4])
                            expec.fulfill()
                        }
                    }
                }
            }
        }
        
        wait(for: [expec], timeout: 20)
        
    }
    
    func test_historyModel_loadHistory_inicialGame () {
        
        //Given
        let sut = HistoryModel()
        let _ = GameState()
        
        
        //When
        let interaction = sut.loadHistory()
        
        //Then
        XCTAssertEqual(interaction, [])
        
    }
    
    func test_historyModel_getHistory_positiveNegativePositive () {
        
        //Given
        let sut = HistoryModel()
        let gameState = GameState()
        let interactionOne = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionTwo = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionTree = Interaction(playerAnswer: "Sad", answerPolarity: .negative)
        let interactionFour = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionArray = [interactionOne, interactionTwo, interactionTree, interactionFour]
        
        //When
        gameState.save(interactionArray)
        let interaction = sut.loadHistory()
        let historia = getHistoryPositiveNegativePositiveNeutral()
        
        //Then
        XCTAssertEqual(interaction[0], historia[0])
        XCTAssertEqual(interaction[1], interactionArray[0].playerAnswer)
    
        XCTAssertEqual(interaction[2], historia[1])
        XCTAssertEqual(interaction[3], interactionArray[1].playerAnswer)
               
        XCTAssertEqual(interaction[4], historia[2])
        XCTAssertEqual(interaction[5], interactionArray[2].playerAnswer)
        
        XCTAssertEqual(interaction[6], historia[3])
        XCTAssertEqual(interaction[7], interactionArray[3].playerAnswer)
    }
    
    func test_historyModel_getHistory_positiveNegativeNegative () {
        
        //Given
        let sut = HistoryModel()
        let gameState = GameState()
        let interactionOne = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionTwo = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionTree = Interaction(playerAnswer: "Sad", answerPolarity: .negative)
        let interactionFour = Interaction(playerAnswer: "Sad", answerPolarity: .negative)
        let interactionArray = [interactionOne, interactionTwo, interactionTree, interactionFour]
        
        //When
        gameState.save(interactionArray)
        let interaction = sut.loadHistory()
        let historia = getHistoryPositiveNegativeNegativeNeutral()
        
        //Then
        XCTAssertEqual(interaction[0], historia[0])
        XCTAssertEqual(interaction[1], interactionArray[0].playerAnswer)
    
        XCTAssertEqual(interaction[2], historia[1])
        XCTAssertEqual(interaction[3], interactionArray[1].playerAnswer)
                   
        XCTAssertEqual(interaction[4], historia[2])
        XCTAssertEqual(interaction[5], interactionArray[2].playerAnswer)
            
        XCTAssertEqual(interaction[6], historia[3])
        XCTAssertEqual(interaction[7], interactionArray[3].playerAnswer)
        
    }
    
    func test_historyModel_getHistory_positiveNeutralPositive () {
        
        //Given
        let sut = HistoryModel()
        let gameState = GameState()
        let interactionOne = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionTwo = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionTree = Interaction(playerAnswer: "Neutral", answerPolarity: .neutral)
        let interactionFour = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionArray = [interactionOne, interactionTwo, interactionTree, interactionFour]
        
        //When
        gameState.save(interactionArray)
        let interaction = sut.loadHistory()
        let historia = getHistoryPositiveNeutralPositiveNeutral()
        
        //Then
        XCTAssertEqual(interaction[0], historia[0])
        XCTAssertEqual(interaction[1], interactionArray[0].playerAnswer)
        
        XCTAssertEqual(interaction[2], historia[1])
        XCTAssertEqual(interaction[3], interactionArray[1].playerAnswer)
        
        XCTAssertEqual(interaction[4], historia[2])
        XCTAssertEqual(interaction[5], interactionArray[2].playerAnswer)
        
        XCTAssertEqual(interaction[6], historia[3])
        XCTAssertEqual(interaction[7], interactionArray[3].playerAnswer)
    }
    
    func test_historyModel_getHistory_positiveNeutralNegative () {
     
        //Given
        let sut = HistoryModel()
        let gameState = GameState()
        let interactionOne = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionTwo = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionTree = Interaction(playerAnswer: "Neutral", answerPolarity: .neutral)
        let interactionFour = Interaction(playerAnswer: "Sad", answerPolarity: .negative)
        let interactionArray = [interactionOne, interactionTwo, interactionTree, interactionFour]
        
        //When
        gameState.save(interactionArray)
        let interaction = sut.loadHistory()
        let historia = getHistoryPositiveNeutralNegativeNeutral()
        
        //Then
        XCTAssertEqual(interaction[0], historia[0])
        XCTAssertEqual(interaction[1], interactionArray[0].playerAnswer)
        
        XCTAssertEqual(interaction[2], historia[1])
        XCTAssertEqual(interaction[3], interactionArray[1].playerAnswer)
        
        XCTAssertEqual(interaction[4], historia[2])
        XCTAssertEqual(interaction[5], interactionArray[2].playerAnswer)
        
        XCTAssertEqual(interaction[6], historia[3])
        XCTAssertEqual(interaction[7], interactionArray[3].playerAnswer)
    }
    
    func test_historyModel_loadHistory_fullGame(){
        
        //Given
        let sut = HistoryModel()
        let gameState = GameState()
        let interactionOne = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionTwo = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionTree = Interaction(playerAnswer: "Neutral", answerPolarity: .neutral)
        let interactionFour = Interaction(playerAnswer: "Sad", answerPolarity: .negative)
        let interactionFive = Interaction(playerAnswer: "Neutral", answerPolarity: .neutral)
        let interactionArray = [interactionOne, interactionTwo, interactionTree, interactionFour, interactionFive]
        
        //When
        gameState.save(interactionArray)
        let interaction = sut.loadHistory()
        let historia = getHistoryPositiveNeutralNegativeNeutral()
        
        //Then
        XCTAssertEqual(interaction[0], historia[0])
        XCTAssertEqual(interaction[1], interactionArray[0].playerAnswer)
        
        XCTAssertEqual(interaction[2], historia[1])
        XCTAssertEqual(interaction[3], interactionArray[1].playerAnswer)
        
        XCTAssertEqual(interaction[4], historia[2])
        XCTAssertEqual(interaction[5], interactionArray[2].playerAnswer)
        
        XCTAssertEqual(interaction[6], historia[3])
        XCTAssertEqual(interaction[7], interactionArray[3].playerAnswer)
        
        XCTAssertEqual(interaction[8], historia[4])
        XCTAssertEqual(interaction[9], interactionArray[4].playerAnswer)
    }
    
    
    func getHistoryPositiveNeutralNegativeNeutral() -> [String]{
        let historiaInicial = "O vazio é bem confortante e seguro de fato, não concorda?, aqui você não tem nada a temer, nada a arriscar, nada a expor, é a bolha perfeita, Nada acontece!\nVocê não parece muito confortável ou seguro, ou estou enganado?, poucos são aqueles que merecem o vazio, estou aqui para alerta-lo, você ainda pode merecer ,porém saiba de uma coisa, após começar, não terá mais volta, Algo maior está para acontecer e suas ações influenciarão oque ocorrerá, Como você se sente sabendo de tudo isso!?\n"
        
        let parte1Positive = "Lentamente os seus olhos se abrem e a imagem que aparece é a a visão sua de dentro do carro olhando para o parque.\nVocê rapidamente liga o rádio e começa a tocar uma música calma instantaneamente\n\"Que sonho... estranhamente me sinto motivado\"\nVocê olha para os lados e vê apenas uma caixa, o carro está um pouco acabado e sujo\n\"Por quê estou aqui mesmo...?\"\nVocê reflete um pouco e logo se recorda de tudo\n\"Certo certo, acho que acabei cochilando enquanto esperava chegar próximo das 16:30, para poder entregar essa encomenda(caixa) para a ...\"\nOlhando rápidamente para o horário no rádio\n\"16:20... melhor eu me apressar, apesar de que não tenho certeza de onde ela esteja, pelo visto vou dar uma explorada nessa parque estranho, nunca vim aqui mesmo.\"\nVocê pega a caixa e saí do carro, e começa a caminhar pelo parque a procura da pessoa. Após alguns poucos minutos caminhando você percebe um gatinho preto claro com belos olhos azuis.\n\"Hum.. estou sendo seguido, o que achei desse gatinho?\"\n"
        
        let neutralNeutral = "Após algum tempo o gatinho que perseguia tenta pular em sua encomenda, porém você percebe a ação e protege-a bem, depois disso o gatinho para de perturbar e some de vista, ele parecia chateado\n\"Esse gatinho realmente era bem chato, será que verei ele de novo?, enfim, vou entregar logo essa encomenda para poder voltar e descansar despreocupado!\"\nRapidamente você percebe que a pessoa da encomenda está logo a frente, ela está junta de varias outras pessoas\n\"será que ela entrou para uma gangue... melhor eu não pensar nisso e só entregar isso, o chefe pediu para eu não questionar sobre essa entrega... por quê?\"\nApós ela perceber sua presença ela rapidamente acena e você se aproxima e entrega a encomenda, não tem muito papo, ela parecia apressada e apreensiva, ela paga o preço da encomenda e põe uma gorjeta extra!, parece que finalmente você deu sorte, Após isso todos que estavam com ela entram em seus carros e saem em disparada, uma coisa neles chama a sua atenção.\n\"Símbolo estranho , porém tenho a impressão que já vi em algum lugar, acho que não deve ser importante, Melhor eu voltar para casa\"\nVocê da meia volta e começa o percurso de volta, porém antes que possa chegar ao seu carro você se depara com um garotinho um pouco sujo chorando desesperado, isso é suficiente para chamar sua atenção.\n\"Oque aconteceu menino? Por quê você está assim?\"\nO garoto ignora e continua em prantos\n\"Onde está seus pais garoto?\"\nele enfim percebe sua presença e responde:\n\"Cuno não Sabe oque isso significa moço\"\n\"Você não tem familia?...Cuno?\"\n\"Cuno só tem o senhor bigodes \"\n\"Tudo bem...Quem é senhor bigodes, por que não está com ele?\"\nEle enxuga suas lágrimas e então começa a explicar, apesar de pequeno ele sabia falar bem.\n\"Por quê ele foi para o Bosque, ele é meu amigo, ele tem pelo preto e olhos azuis!, ele não está aqui!!! Por favor me ajuda a pegar ele , eu tenho medo de entrar no bosque sozinho, esse bosque não perdoa crianças moço, por favor!\"\nVocê sente uma imensa empatia com o garoto, e percebe que ele fala coincidentemente do gato que você havia acariciado alguns minutos atrás, Você está decidido a ajudar o Cuno!\n\"Tudo bem, vamos encontrar o sr bigodes, me siga que te ajudarei\"\nO garoto abre um sorriso de admiração que enche seu coração de determinação ainda mais!. Com isso vocês dois começam a entrar no bosque e explorar, era um bosque de pinheiros estranhos , eram um pouco assustadores, e o som do bosque também era um pouco desafiante!, você entende por quê cuno tinha tanto medo de entrar só nesse bosque...\nApós um pouco de tempo você começa a escutar alguém conversando\n\"É o senhor Bigodes!!\"\n\"Shh...\"\nVocê percebe uma mulher e um homem com jaquetas de couro e varias caixas próximas dele , eles seguravam um gato , e com certeza esse era o senhor bigodes, dava pra notar que os dois portavam armas e que com certeza eram perigosos, haviam outros animais ali. Voce escuta eles conversando:\n\"Você realmente achava que conseguiria salvar todos eles coisinha fofa , saiba que não temos pena de traídores\"\n\"Isso ai , vamos ter que ensinar novamente as regras para você\"\nEntão voce pensa:\n\"..merda, eles são malucos, vão realmente machucar ele?\"\nE ve o menino apreensivo:\n\"Não ! não deixe eles machucarem ele!\"\nSeu coração começa a pulsar forte, você já está suando e precisa fazer alguma coisa, eles vão machucar o Senhor bigodes, essa situação faz você sentir muitas coisas diferentes, OQUE VOCÊ MAIS SENTE !?\n"
        
        let neutralNegative = "Você Não pode deixar essa injustiça continuar, porém não tem um plano e não tem como enfrentar duas pessoas armadas, porém um impulso dentro de si acontece, você AGE!\n\"Quem tá ai!?\"\nVoce entao tenta disfarçar:\n\"Eae, acabei me perdendo aqui no bosque e acabei encontrando vocês\"\n\"Não tem nada pra ver aqui, se você der meia volta agora eu faço vista grossa\"\nEle parece convicto! porém você sabe que eles são peões mercenários!\nVocê põe a mão no bolso e vê todo dinheiro que você tem.\nEsse é o dinheiro do seu aluguel, porém não tem jeito, voce nao pode deixar isso continuar!\n\"Vou direto ao ponto, Vocês tem algo que me interessa e que acho que vocês não vão precisar , podemos fazer uma troca\"\nVoce esta muito nervoso, como consigo falar tão calmamente, se eu errar algo ruim vai ocorrer!\n\"Algo que lhe interessa? você sabe com quem está se met...\"\nA mulher entao fala: \n\"Cala boca por favor, deixa ele terminar\"\nIsso! acho que vai funcionar! tenho 1000 reais em meu bolso, deve ser suficiente, vou começar com algo baixo\n\"Tenho 400 reais e vocês tem esse belo gato, acho que já entenderam\"\n\"Sabia, ele acha que pode comprar a gente, saiba que isso é lixo comparado com o mínimo que pensaríamos em aceitar\"\nNãoo...\n\"Acho que ele tá zoando com nossa cara , posso finalizar esse otário!?\"\nSe eu fugir agora ainda posso me livrar... mas ... Eu...\nPode parecer que seu plano falhou , porém enquanto você entretida os dois e distraia-os , deu tempo para que Cuno pudesse se esgueirar e gerar a discordia, estava óbvio que havia mais animais ali, e ele consegue abrir uma das caixas que havia la, diversos animais saem de lá , alguns fogem para adentro o bosque, outros para fora, porém alguns vão para cima dos dois que percebendo a gravidade começam a fugir, pois falamos de leões , Ursos e animais fortes (Oque eles faziam nesse pequeno bosque!?), enquanto fugiam eles tiraram suas armas e atiraram nos animais, uma das balas perdidas acaba indo em direção do garoto\nNÃO!!!\nIsso não pode ter acontecido...\nAo olhar com mais cautela você nova que aqueles dois criminosos cujo ódio foi cravado em seu coração tinham marcas familiares em suas costas da jaqueta. você evita olhar para o garoto, mas uma hora é inevitável , e percebe que ele está vivo, sem ferimento! OQUE ACONTECEU?!\nPorém ele estava chorando... oque? SENHOR BIGODE!, ele defendeu seu amigo da bala se sacrificando!\nO Bosque rapidamente se tornou vazio e restava apenas os 3 , Você , cuno e o senhor bigodes gravemente ferido ... Cuno estava em prantos, porém após um tempo os lamentos dele param, você finalmente cria coragem e se aproxima...\nAlgo estava errado, porém felizmente errado!, Cuno estava bem, e o senhor bigodes também!, apesar do sangue derramado, ele não parecia ter ferimentos!? oque aconteceu?! Então o garoto fala:\n\"Muito obrigado Senhor, eu estou muito feliz e grato, Senhor bigodes perdeu uma de suas vidas, mas tudo bem pois estamos juntos mais uma vez! , por favor senhor, pegue isto, o senhor bigodes disse que eu tenho que ir rápido, você também tem que ir!\"\nOque está acontecendo, uma vida? , é muita informação complexa vindo de uma criança para digerir. Você aceita o objeto perplexo e sem entender absolutamente nada que havia acabado de acontecer, o garoto e o gatinho correm e logo desaparecem de vista. Começa a chover , é uma chuva fina sem muito barulho...\n\"Isso foi realmente intenso... Saber que você preferiu isso ao perfeito vazio é lamentável...\"\nVocê perdeu tudo isso, você agora não terá mais paz até finalmente descobrir tudo, e isso pode lhe custar muita mais que apenas tempo, no vazio, não há oque perder... mas você tinha que acabar com isso não é!?, tudo bem , se prepare , essa é a ultima vez que te alerto, Você ainda pode parar...\nA chuva está mais forte... Ja e noite e voce esta em casa.\nVocê está de frente para tv, acabou de sentar após chegar em sua casa, você está observando o pequeno objeto que o garoto lhe entregou e assistindo ao jornal.\n\"Hoje foi encontrado o Garoto que estava desaparecido há algumas semanas, Bigode , de 9 anos foi encontrado baleado no meio do bosque, de acordo com a autópsia, foi uma morta instantanea\"\nA imagem que aparece na tv é a do garoto que você havia ajudado mais cedo...\nO palpitar novamente acelera... Oque você está sentido para isso acontecer!?\n"
        
        let neutralNeutral2 = "Voce então volta a olhar para a TV:\n\"Horário da morte, 16:45 é o que os especialistas indicam, não foram encontrados mais rastros...\"\nVoce começa a pensar:\n\"Por que estou me sentindo assim? o que é isso?\"\nDe repente você ativa o objeto que ganhou sem que perceba, um holograma aparece e junta com ele uma mensagem...\n\"Me Procure...\"\n"
        
        return [historiaInicial, parte1Positive, neutralNeutral, neutralNegative, neutralNeutral2]
    }
    
    func getHistoryPositiveNeutralPositiveNeutral() -> [String]{
        let historiaInicial = "O vazio é bem confortante e seguro de fato, não concorda?, aqui você não tem nada a temer, nada a arriscar, nada a expor, é a bolha perfeita, Nada acontece!\nVocê não parece muito confortável ou seguro, ou estou enganado?, poucos são aqueles que merecem o vazio, estou aqui para alerta-lo, você ainda pode merecer ,porém saiba de uma coisa, após começar, não terá mais volta, Algo maior está para acontecer e suas ações influenciarão oque ocorrerá, Como você se sente sabendo de tudo isso!?\n"
        
        let parte1Positive = "Lentamente os seus olhos se abrem e a imagem que aparece é a a visão sua de dentro do carro olhando para o parque.\nVocê rapidamente liga o rádio e começa a tocar uma música calma instantaneamente\n\"Que sonho... estranhamente me sinto motivado\"\nVocê olha para os lados e vê apenas uma caixa, o carro está um pouco acabado e sujo\n\"Por quê estou aqui mesmo...?\"\nVocê reflete um pouco e logo se recorda de tudo\n\"Certo certo, acho que acabei cochilando enquanto esperava chegar próximo das 16:30, para poder entregar essa encomenda(caixa) para a ...\"\nOlhando rápidamente para o horário no rádio\n\"16:20... melhor eu me apressar, apesar de que não tenho certeza de onde ela esteja, pelo visto vou dar uma explorada nessa parque estranho, nunca vim aqui mesmo.\"\nVocê pega a caixa e saí do carro, e começa a caminhar pelo parque a procura da pessoa. Após alguns poucos minutos caminhando você percebe um gatinho preto claro com belos olhos azuis.\n\"Hum.. estou sendo seguido, o que achei desse gatinho?\"\n"
        
        let neutralNeutral = "Após algum tempo o gatinho que perseguia tenta pular em sua encomenda, porém você percebe a ação e protege-a bem, depois disso o gatinho para de perturbar e some de vista, ele parecia chateado\n\"Esse gatinho realmente era bem chato, será que verei ele de novo?, enfim, vou entregar logo essa encomenda para poder voltar e descansar despreocupado!\"\nRapidamente você percebe que a pessoa da encomenda está logo a frente, ela está junta de varias outras pessoas\n\"será que ela entrou para uma gangue... melhor eu não pensar nisso e só entregar isso, o chefe pediu para eu não questionar sobre essa entrega... por quê?\"\nApós ela perceber sua presença ela rapidamente acena e você se aproxima e entrega a encomenda, não tem muito papo, ela parecia apressada e apreensiva, ela paga o preço da encomenda e põe uma gorjeta extra!, parece que finalmente você deu sorte, Após isso todos que estavam com ela entram em seus carros e saem em disparada, uma coisa neles chama a sua atenção.\n\"Símbolo estranho , porém tenho a impressão que já vi em algum lugar, acho que não deve ser importante, Melhor eu voltar para casa\"\nVocê da meia volta e começa o percurso de volta, porém antes que possa chegar ao seu carro você se depara com um garotinho um pouco sujo chorando desesperado, isso é suficiente para chamar sua atenção.\n\"Oque aconteceu menino? Por quê você está assim?\"\nO garoto ignora e continua em prantos\n\"Onde está seus pais garoto?\"\nele enfim percebe sua presença e responde:\n\"Cuno não Sabe oque isso significa moço\"\n\"Você não tem familia?...Cuno?\"\n\"Cuno só tem o senhor bigodes \"\n\"Tudo bem...Quem é senhor bigodes, por que não está com ele?\"\nEle enxuga suas lágrimas e então começa a explicar, apesar de pequeno ele sabia falar bem.\n\"Por quê ele foi para o Bosque, ele é meu amigo, ele tem pelo preto e olhos azuis!, ele não está aqui!!! Por favor me ajuda a pegar ele , eu tenho medo de entrar no bosque sozinho, esse bosque não perdoa crianças moço, por favor!\"\nVocê sente uma imensa empatia com o garoto, e percebe que ele fala coincidentemente do gato que você havia acariciado alguns minutos atrás, Você está decidido a ajudar o Cuno!\n\"Tudo bem, vamos encontrar o sr bigodes, me siga que te ajudarei\"\nO garoto abre um sorriso de admiração que enche seu coração de determinação ainda mais!. Com isso vocês dois começam a entrar no bosque e explorar, era um bosque de pinheiros estranhos , eram um pouco assustadores, e o som do bosque também era um pouco desafiante!, você entende por quê cuno tinha tanto medo de entrar só nesse bosque...\nApós um pouco de tempo você começa a escutar alguém conversando\n\"É o senhor Bigodes!!\"\n\"Shh...\"\nVocê percebe uma mulher e um homem com jaquetas de couro e varias caixas próximas dele , eles seguravam um gato , e com certeza esse era o senhor bigodes, dava pra notar que os dois portavam armas e que com certeza eram perigosos, haviam outros animais ali. Voce escuta eles conversando:\n\"Você realmente achava que conseguiria salvar todos eles coisinha fofa , saiba que não temos pena de traídores\"\n\"Isso ai , vamos ter que ensinar novamente as regras para você\"\nEntão voce pensa:\n\"..merda, eles são malucos, vão realmente machucar ele?\"\nE ve o menino apreensivo:\n\"Não ! não deixe eles machucarem ele!\"\nSeu coração começa a pulsar forte, você já está suando e precisa fazer alguma coisa, eles vão machucar o Senhor bigodes, essa situação faz você sentir muitas coisas diferentes, OQUE VOCÊ MAIS SENTE !?\n"
        
        let neutralPositive = "Você Observa, percebe o desespero de Cuno mas não consegue avançar , algo o impede, VOCÊ MESMO SE IMPEDE!\n\"Quem tá ai!?\" Diz o homen com o gatinho.\nCuno não aguenta ver aquilo mais nem um segundo e avança desesperado em busca de seu amigo!. Voce então fala:\n\"Oque é isso! parado garoto!\"\nEle não escuta e ao chegar mais próximo desfere um chute em uma parte delicada do Homem que solta um alto Grito de dor!\n\"AH SEU DESGRAÇADO, VOCÊ NÃO DEVIA TER FEITO ISSO!!!!\"\nEle solta o gatinho que fica em posse da Mulher. Você Finalmente decide agir, algo de ruim iria acontecer com o garoto também, você não podia mais ficar parado! Se esgueirando entre o mato você se aproxima pelas costas dos dois, porém você nota uma arma com eles! Eles são malucos, ele tira uma arma e aponta para o garoto, que distraído tentando tirar o gatinho da Mulher recebe uma forte coronhada na nuca e cai no chão\n\"Merda! eles não tão brincando, se eles me verem eles não pegarão tão leve\" \nVocê percebe a jaqueta com aquele simbolo estranho do carro neles, porém você sabe que não é mais possível usar da diplomacia, você observa em volta e percebe varias caixas, uma muito grande, há som de animais vindo dela... talvez o caos faça eles perderem o foco do garoto! O gatinho também está bem inquieto após presenciar a cena\n\"Você não precisava de tanto.\"\n\"Cara , ELE CHUTOU MEU SACO, pivete desgramado pediu por isso\"\n\"Hahaha devo admitir que esse garoto tem culhões\"\n\"Muito engraçado, então oque fazemos?\"\nO gatinho ataca a Mulher nesse momento de distração, sozinha ela acaba soltando ele que pula de cima dela e corre para ver a situação de seu amigo, ele parece estar disposto a se sacrificar pelo seu amigo Cuno\n\"Aí! gato maldito, não deixa ele fugir\"\nEnquanto isso você está desbloqueando as caixas , há diversas criaturas ferozes, você abre ela rápidamente e se esconde em um mato próximo, as feras começam a sair em silencio, até que um grande leão sai de dentro e ruge com todas as forças e corre em direção dos Homem e Mulher, como se guardassem grande rancor deles\n\"Merda, oque aconteceu!?\"\n\"Cala boca e Corre!\"\n\"Mas e A chefe!?\"\nEles correm e começam a atirar com suas armas em direção àquelas feras até sumirem de vista, o som dos tiros entretanto duram por um bom tempo , até o silêncio total assumir a floresta e uma fina chuva começar, com isso você percebe que a barra está limpa e saí do pequeno esconderijo para ver a situação do garoto\nNãoo...\nNÃO!!!\nIsso não pode ter acontecido...\nVocê evita olhar para o garoto e o gatinho, mas já percebeu o sangue no chão...\nUma hora torna-se inevitável, e chega lentamente próximo do garoto e do gatinho e nota um ferimento de bala no gatinho que está caido na frente do garoto... ele realmente se sacrificou pelo garoto que ainda nao acordou.\nO Bosque rapidamente se tornou vazio e restava apenas os 3 , Você , Cuno e o senhor bigodes gravemente ferido ... Cuno finalmente começa a se mover e acorda, ele percebe a situação e nota que você está muito mal. Porém ele estava calmo. Algo estava errado, porém Felizmente errado!, pois o gatinho começa a se mover e Cuno decidi dar uma acariciada no Sr Bigode! e entao fala:\n\"Muito obrigado Senhor,Eu estou muito feliz e grato, Senhor bigodes perdeu uma de suas vidas, mas tudo bem pois estamos juntos denovo! , por favor senhor, pegue isto, o senhor bigodes disse que eu tenho que ir rápido, você também tem que ir!\"\nOque está acontecendo, uma vida? , é muita informação complexa vindo de uma criança para digerir. Você aceita o objeto perplexo e sem entender absolutamente nada que havia acabado de acontecer, o garoto e o gatinho correm e logo desaparecem de vista\n\"Isso foi realmente intenso... Saber que você preferiu isso ao perfeito vazio é lamentável...\"\nVocê perdeu tudo isso, você agora não terá mais paz até finalmente descobrir tudo, e isso pode lhe custar muita mais que apenas tempo, no vazio, não há oque perder... mas você tinha que acabar com isso não é!?, tudo bem , se prepare , essa é a ultima vez que te alerto, Você ainda pode parar...\nA chuva está mais forte, Ja é noite. Você está de frente para tv , Acabou de sentar após chegar em sua casa, você está observando o pequeno objeto que o garoto lhe entregou e assistindo ao jornal na tv:\n\"Hoje foi encontrado o Garoto que estava desaparecido há algumas semanas, Bigode , de 9 anos foi encontrado baleado no meio do bosque, de acordo com a autópsia, foi uma morta instantanea\"\nA imagem que aparece é a do garoto que você havia ajudado mais cedo...\nO palpitar novamente acelera... Oque você está sentido para isso acontecer!?"
        
        let neutralNeutral2 = "Voce então volta a olhar para a TV:\n\"Horário da morte, 16:45 é o que os especialistas indicam, não foram encontrados mais rastros...\"\nVoce começa a pensar:\n\"Por que estou me sentindo assim? o que é isso?\"\nDe repente você ativa o objeto que ganhou sem que perceba, um holograma aparece e junta com ele uma mensagem...\n\"Me procure...\"\n"
        
        return [historiaInicial, parte1Positive, neutralNeutral, neutralPositive, neutralNeutral2]
    }
    
    
    func getHistoryPositiveNegativeNegativeNeutral() -> [String]{
        
        let historiaInicial = "O vazio é bem confortante e seguro de fato, não concorda?, aqui você não tem nada a temer, nada a arriscar, nada a expor, é a bolha perfeita, Nada acontece!\nVocê não parece muito confortável ou seguro, ou estou enganado?, poucos são aqueles que merecem o vazio, estou aqui para alerta-lo, você ainda pode merecer ,porém saiba de uma coisa, após começar, não terá mais volta, Algo maior está para acontecer e suas ações influenciarão oque ocorrerá, Como você se sente sabendo de tudo isso!?\n"
        
        let parte1Positive = "Lentamente os seus olhos se abrem e a imagem que aparece é a a visão sua de dentro do carro olhando para o parque.\nVocê rapidamente liga o rádio e começa a tocar uma música calma instantaneamente\n\"Que sonho... estranhamente me sinto motivado\"\nVocê olha para os lados e vê apenas uma caixa, o carro está um pouco acabado e sujo\n\"Por quê estou aqui mesmo...?\"\nVocê reflete um pouco e logo se recorda de tudo\n\"Certo certo, acho que acabei cochilando enquanto esperava chegar próximo das 16:30, para poder entregar essa encomenda(caixa) para a ...\"\nOlhando rápidamente para o horário no rádio\n\"16:20... melhor eu me apressar, apesar de que não tenho certeza de onde ela esteja, pelo visto vou dar uma explorada nessa parque estranho, nunca vim aqui mesmo.\"\nVocê pega a caixa e saí do carro, e começa a caminhar pelo parque a procura da pessoa. Após alguns poucos minutos caminhando você percebe um gatinho preto claro com belos olhos azuis.\n\"Hum.. estou sendo seguido, o que achei desse gatinho?\"\n"
        
        let negativeNegative = "Após algum tempo de carinho o gatinho tenta pular em cima de seu braço, quase como se quisesse derrubar a caixa,E CONSEGUE! Você escuta claramente algo se quebrar, enquanto o gatinho dá a volta e sai de perto, ele parecia bem feliz com os carinhos pelo menos...\n\"Esse gato Maldito! eu não deveria ter dado atenção a ele, será que verei ele denovo?, enfim, vou entregar logo essa encomenda para poder voltar, espero que não tenha quebrado, espero que eles não chequem\"\nRapidamente você percebe que a pessoa da encomenda está logo a frente, ela está junta de varias outras pessoas\n\"será que ela entrou para uma gangue... melhor eu não pensar nisso e só entregar isso, o chefe pediu para eu não questionar sobre essa entrega... por quê?\"\nApós ela perceber sua presença ela rapidamente acena e você se aproxima e entrega a encomenda, não tem muito papo, ela parecia apressada e apreensiva, ela paga o preço da encomenda e põe uma gorjeta extra!, parece que finalmente você deu sorte.\n\"URFA , Ela está com pressa e não checou se havia quebrado... melhor eu não falar com ela por um tempo\"\n Após isso todos que estavam com ela entram em seus carros e saem em disparada, uma coisa neles chama a sua atenção.\n\"Símbolo estranho , porém tenho a impressão que já vi em algum lugar, acho que não deve ser importante, Melhor eu voltar para casa\"\nVocê da meia volta e começa o percurso de volta, porém antes que possa chegar ao seu carro você se depara com um garotinho um pouco sujo chorando desesperado, isso é suficiente para chamar sua atenção.\n\"Oque aconteceu menino? Por quê você está assim?\"\nO garoto ignora e continua em prantos\n\"Onde está seus pais garoto?\"\nele enfim percebe sua presença e responde:\n\"Cuno não Sabe oque isso significa moço\"\n\"Você não tem familia?...Cuno?\"\n\"Cuno só tem o senhor bigodes \"\n\"Tudo bem...Quem é senhor bigodes, por que não está com ele?\"\nEle enxuga suas lágrimas e então começa a explicar, apesar de pequeno ele sabia falar bem.\n\"Por quê ele foi para o Bosque, ele é meu amigo, ele tem pelo preto e olhos azuis!, ele não está aqui!!! Por favor me ajuda a pegar ele , eu tenho medo de entrar no bosque sozinho, esse bosque não perdoa crianças moço, por favor!\"\nVocê sente uma imensa empatia com o garoto, e percebe que ele fala coincidentemente do gato que você havia acariciado alguns minutos atrás, Você está decidido a ajudar o Cuno!\n\"Tudo bem, vamos encontrar o sr bigodes, me siga que te ajudarei\"\nO garoto abre um sorriso de admiração que enche seu coração de determinação ainda mais!. Com isso vocês dois começam a entrar no bosque e explorar, era um bosque de pinheiros estranhos , eram um pouco assustadores, e o som do bosque também era um pouco desafiante!, você entende por quê cuno tinha tanto medo de entrar só nesse bosque...\nApós um pouco de tempo você começa a escutar alguém conversando\n\"É o senhor Bigodes!!\"\n\"Shh...\"\nVocê percebe uma mulher e um homem com jaquetas de couro e varias caixas próximas dele , eles seguravam um gato , e com certeza esse era o senhor bigodes, dava pra notar que os dois portavam armas e que com certeza eram perigosos, haviam outros animais ali. Voce escuta eles conversando:\n\"Você realmente achava que conseguiria salvar todos eles coisinha fofa , saiba que não temos pena de traídores\"\n\"Isso ai , vamos ter que ensinar novamente as regras para você\"\nEntão voce pensa:\n\"..merda, eles são malucos, vão realmente machucar ele?\"\nE ve o menino apreensivo:\n\"Não ! não deixe eles machucarem ele!\"\nSeu coração começa a pulsar forte, você já está suando e precisa fazer alguma coisa, eles vão machucar o Senhor bigodes, essa situação faz você sentir muitas coisas diferentes, OQUE VOCÊ MAIS SENTE !?\n"
        
        let negativeNegative2 = "Você Não pode deixar essa injustiça continuar, porém não tem um plano e não tem como enfrentar duas pessoas armadas, porém um impulso dentro de si acontece, você AGE!\n\"Quem tá ai!?\"\nVoce entao tenta disfarçar:\n\"Eae, acabei me perdendo aqui no bosque e acabei encontrando vocês\"\n\"Não tem nada pra ver aqui, se você der meia volta agora eu faço vista grossa\"\nEle parece convicto! porém você sabe que eles são peões mercenários!\nVocê põe a mão no bolso e vê todo dinheiro que você tem.\nEsse é o dinheiro do seu aluguel, porém não tem jeito, voce nao pode deixar isso continuar!\n\"Vou direto ao ponto, Vocês tem algo que me interessa e que acho que vocês não vão precisar , podemos fazer uma troca\"\nVoce esta muito nervoso, como consigo falar tão calmamente, se eu errar algo ruim vai ocorrer!\n\"Algo que lhe interessa? você sabe com quem está se met...\"\nA mulher entao fala: \n\"Cala boca por favor, deixa ele terminar\"\nIsso! acho que vai funcionar! tenho 1000 reais em meu bolso, deve ser suficiente, vou começar com algo baixo\n\"Tenho 400 reais e vocês tem esse belo gato, acho que já entenderam\"\n\"Sabia, ele acha que pode comprar a gente, saiba que isso é lixo comparado com o mínimo que pensaríamos em aceitar\"\nNãoo...\n\"Acho que ele tá zoando com nossa cara , posso finalizar esse otário!?\"\nSe eu fugir agora ainda posso me livrar... mas ... Eu...\nPode parecer que seu plano falhou , porém enquanto você entretida os dois e distraia-os , deu tempo para que Cuno pudesse se esgueirar e gerar a discordia, estava óbvio que havia mais animais ali, e ele consegue abrir uma das caixas que havia la, diversos animais saem de lá , alguns fogem para adentro o bosque, outros para fora, porém alguns vão para cima dos dois que percebendo a gravidade começam a fugir, pois falamos de leões , Ursos e animais fortes (Oque eles faziam nesse pequeno bosque!?), enquanto fugiam eles tiraram suas armas e atiraram nos animais, uma das balas perdidas acaba indo em direção do garoto\nNÃO!!!\nIsso não pode ter acontecido...\nAo olhar com mais cautela você nova que aqueles dois criminosos cujo ódio foi cravado em seu coração tinham marcas familiares em suas costas da jaqueta. você evita olhar para o garoto, mas uma hora é inevitável , e percebe que ele está vivo, sem ferimento! OQUE ACONTECEU?!\nPorém ele estava chorando... oque? SENHOR BIGODE!, ele defendeu seu amigo da bala se sacrificando!\nO Bosque rapidamente se tornou vazio e restava apenas os 3 , Você , cuno e o senhor bigodes gravemente ferido ... Cuno estava em prantos, porém após um tempo os lamentos dele param, você finalmente cria coragem e se aproxima...\nAlgo estava errado, porém felizmente errado!, Cuno estava bem, e o senhor bigodes também!, apesar do sangue derramado, ele não parecia ter ferimentos!? oque aconteceu?! Então o garoto fala:\n\"Muito obrigado Senhor, eu estou muito feliz e grato, Senhor bigodes perdeu uma de suas vidas, mas tudo bem pois estamos juntos mais uma vez! , por favor senhor, pegue isto, o senhor bigodes disse que eu tenho que ir rápido, você também tem que ir!\"\nOque está acontecendo, uma vida? , é muita informação complexa vindo de uma criança para digerir. Você aceita o objeto perplexo e sem entender absolutamente nada que havia acabado de acontecer, o garoto e o gatinho correm e logo desaparecem de vista. Começa a chover , é uma chuva fina sem muito barulho...\n\"Isso foi realmente intenso... Saber que você preferiu isso ao perfeito vazio é lamentável...\"\nVocê perdeu tudo isso, você agora não terá mais paz até finalmente descobrir tudo, e isso pode lhe custar muita mais que apenas tempo, no vazio, não há oque perder... mas você tinha que acabar com isso não é!?, tudo bem , se prepare , essa é a ultima vez que te alerto, Você ainda pode parar...\nA chuva está mais forte... Ja e noite e voce esta em casa.\nVocê está de frente para tv, acabou de sentar após chegar em sua casa, você está observando o pequeno objeto que o garoto lhe entregou e assistindo ao jornal.\n\"Hoje foi encontrado o Garoto que estava desaparecido há algumas semanas, Bigode , de 9 anos foi encontrado baleado no meio do bosque, de acordo com a autópsia, foi uma morta instantanea\"\nA imagem que aparece na tv é a do garoto que você havia ajudado mais cedo...\nO palpitar novamente acelera... Oque você está sentido para isso acontecer!?\n"
        
        let negativeNeutral = "Voce então volta a olhar para a TV:\n\"Horário da morte, 16:45 é o que os especialistas indicam, não foram encontrados mais rastros...\"\nVoce começa a pensar:\n\"Por que estou me sentindo assim? o que é isso?\"\nDe repente você ativa o objeto que ganhou sem que perceba, um holograma aparece e junta com ele uma mensagem...\n\"Me Procure...\"\n"
        
        return [historiaInicial, parte1Positive, negativeNegative, negativeNegative2, negativeNeutral]
    }
    
    func getHistoryPositiveNegativePositiveNeutral() -> [String]{
        
        let historiaInicial = "O vazio é bem confortante e seguro de fato, não concorda?, aqui você não tem nada a temer, nada a arriscar, nada a expor, é a bolha perfeita, Nada acontece!\nVocê não parece muito confortável ou seguro, ou estou enganado?, poucos são aqueles que merecem o vazio, estou aqui para alerta-lo, você ainda pode merecer ,porém saiba de uma coisa, após começar, não terá mais volta, Algo maior está para acontecer e suas ações influenciarão oque ocorrerá, Como você se sente sabendo de tudo isso!?\n"
        
        let parte1Positive = "Lentamente os seus olhos se abrem e a imagem que aparece é a a visão sua de dentro do carro olhando para o parque.\nVocê rapidamente liga o rádio e começa a tocar uma música calma instantaneamente\n\"Que sonho... estranhamente me sinto motivado\"\nVocê olha para os lados e vê apenas uma caixa, o carro está um pouco acabado e sujo\n\"Por quê estou aqui mesmo...?\"\nVocê reflete um pouco e logo se recorda de tudo\n\"Certo certo, acho que acabei cochilando enquanto esperava chegar próximo das 16:30, para poder entregar essa encomenda(caixa) para a ...\"\nOlhando rápidamente para o horário no rádio\n\"16:20... melhor eu me apressar, apesar de que não tenho certeza de onde ela esteja, pelo visto vou dar uma explorada nessa parque estranho, nunca vim aqui mesmo.\"\nVocê pega a caixa e saí do carro, e começa a caminhar pelo parque a procura da pessoa. Após alguns poucos minutos caminhando você percebe um gatinho preto claro com belos olhos azuis.\n\"Hum.. estou sendo seguido, o que achei desse gatinho?\"\n"
        
        let negativeNegative = "Após algum tempo de carinho o gatinho tenta pular em cima de seu braço, quase como se quisesse derrubar a caixa,E CONSEGUE! Você escuta claramente algo se quebrar, enquanto o gatinho dá a volta e sai de perto, ele parecia bem feliz com os carinhos pelo menos...\n\"Esse gato Maldito! eu não deveria ter dado atenção a ele, será que verei ele denovo?, enfim, vou entregar logo essa encomenda para poder voltar, espero que não tenha quebrado, espero que eles não chequem\"\nRapidamente você percebe que a pessoa da encomenda está logo a frente, ela está junta de varias outras pessoas\n\"será que ela entrou para uma gangue... melhor eu não pensar nisso e só entregar isso, o chefe pediu para eu não questionar sobre essa entrega... por quê?\"\nApós ela perceber sua presença ela rapidamente acena e você se aproxima e entrega a encomenda, não tem muito papo, ela parecia apressada e apreensiva, ela paga o preço da encomenda e põe uma gorjeta extra!, parece que finalmente você deu sorte.\n\"URFA , Ela está com pressa e não checou se havia quebrado... melhor eu não falar com ela por um tempo\"\n Após isso todos que estavam com ela entram em seus carros e saem em disparada, uma coisa neles chama a sua atenção.\n\"Símbolo estranho , porém tenho a impressão que já vi em algum lugar, acho que não deve ser importante, Melhor eu voltar para casa\"\nVocê da meia volta e começa o percurso de volta, porém antes que possa chegar ao seu carro você se depara com um garotinho um pouco sujo chorando desesperado, isso é suficiente para chamar sua atenção.\n\"Oque aconteceu menino? Por quê você está assim?\"\nO garoto ignora e continua em prantos\n\"Onde está seus pais garoto?\"\nele enfim percebe sua presença e responde:\n\"Cuno não Sabe oque isso significa moço\"\n\"Você não tem familia?...Cuno?\"\n\"Cuno só tem o senhor bigodes \"\n\"Tudo bem...Quem é senhor bigodes, por que não está com ele?\"\nEle enxuga suas lágrimas e então começa a explicar, apesar de pequeno ele sabia falar bem.\n\"Por quê ele foi para o Bosque, ele é meu amigo, ele tem pelo preto e olhos azuis!, ele não está aqui!!! Por favor me ajuda a pegar ele , eu tenho medo de entrar no bosque sozinho, esse bosque não perdoa crianças moço, por favor!\"\nVocê sente uma imensa empatia com o garoto, e percebe que ele fala coincidentemente do gato que você havia acariciado alguns minutos atrás, Você está decidido a ajudar o Cuno!\n\"Tudo bem, vamos encontrar o sr bigodes, me siga que te ajudarei\"\nO garoto abre um sorriso de admiração que enche seu coração de determinação ainda mais!. Com isso vocês dois começam a entrar no bosque e explorar, era um bosque de pinheiros estranhos , eram um pouco assustadores, e o som do bosque também era um pouco desafiante!, você entende por quê cuno tinha tanto medo de entrar só nesse bosque...\nApós um pouco de tempo você começa a escutar alguém conversando\n\"É o senhor Bigodes!!\"\n\"Shh...\"\nVocê percebe uma mulher e um homem com jaquetas de couro e varias caixas próximas dele , eles seguravam um gato , e com certeza esse era o senhor bigodes, dava pra notar que os dois portavam armas e que com certeza eram perigosos, haviam outros animais ali. Voce escuta eles conversando:\n\"Você realmente achava que conseguiria salvar todos eles coisinha fofa , saiba que não temos pena de traídores\"\n\"Isso ai , vamos ter que ensinar novamente as regras para você\"\nEntão voce pensa:\n\"..merda, eles são malucos, vão realmente machucar ele?\"\nE ve o menino apreensivo:\n\"Não ! não deixe eles machucarem ele!\"\nSeu coração começa a pulsar forte, você já está suando e precisa fazer alguma coisa, eles vão machucar o Senhor bigodes, essa situação faz você sentir muitas coisas diferentes, OQUE VOCÊ MAIS SENTE !?\n"
        
        let negativePositive = "Você Observa, percebe o desespero de Cuno mas não consegue avançar , algo o impede, VOCÊ MESMO SE IMPEDE!\n\"Quem tá ai!?\" Diz o homen com o gatinho.\nCuno não aguenta ver aquilo mais nem um segundo e avança desesperado em busca de seu amigo!. Voce então fala:\n\"Oque é isso! parado garoto!\"\nEle não escuta e ao chegar mais próximo desfere um chute em uma parte delicada do Homem que solta um alto Grito de dor!\n\"AH SEU DESGRAÇADO, VOCÊ NÃO DEVIA TER FEITO ISSO!!!!\"\nEle solta o gatinho que fica em posse da Mulher. Você Finalmente decide agir, algo de ruim iria acontecer com o garoto também, você não podia mais ficar parado! Se esgueirando entre o mato você se aproxima pelas costas dos dois, porém você nota uma arma com eles! Eles são malucos, ele tira uma arma e aponta para o garoto, que distraído tentando tirar o gatinho da Mulher recebe uma forte coronhada na nuca e cai no chão\n\"Merda! eles não tão brincando, se eles me verem eles não pegarão tão leve\" \nVocê percebe a jaqueta com aquele simbolo estranho do carro neles, porém você sabe que não é mais possível usar da diplomacia, você observa em volta e percebe varias caixas, uma muito grande, há som de animais vindo dela... talvez o caos faça eles perderem o foco do garoto! O gatinho também está bem inquieto após presenciar a cena\n\"Você não precisava de tanto.\"\n\"Cara , ELE CHUTOU MEU SACO, pivete desgramado pediu por isso\"\n\"Hahaha devo admitir que esse garoto tem culhões\"\n\"Muito engraçado, então oque fazemos?\"\nO gatinho ataca a Mulher nesse momento de distração, sozinha ela acaba soltando ele que pula de cima dela e corre para ver a situação de seu amigo, ele parece estar disposto a se sacrificar pelo seu amigo Cuno\n\"Aí! gato maldito, não deixa ele fugir\"\nEnquanto isso você está desbloqueando as caixas , há diversas criaturas ferozes, você abre ela rápidamente e se esconde em um mato próximo, as feras começam a sair em silencio, até que um grande leão sai de dentro e ruge com todas as forças e corre em direção dos Homem e Mulher, como se guardassem grande rancor deles\n\"Merda, oque aconteceu!?\"\n\"Cala boca e Corre!\"\n\"Mas e A chefe!?\"\nEles correm e começam a atirar com suas armas em direção àquelas feras até sumirem de vista, o som dos tiros entretanto duram por um bom tempo , até o silêncio total assumir a floresta e uma fina chuva começar, com isso você percebe que a barra está limpa e saí do pequeno esconderijo para ver a situação do garoto\nNãoo...\nNÃO!!!\nIsso não pode ter acontecido...\nVocê evita olhar para o garoto e o gatinho, mas já percebeu o sangue no chão...\nUma hora torna-se inevitável, e chega lentamente próximo do garoto e do gatinho e nota um ferimento de bala no gatinho que está caido na frente do garoto... ele realmente se sacrificou pelo garoto que ainda nao acordou.\nO Bosque rapidamente se tornou vazio e restava apenas os 3 , Você , Cuno e o senhor bigodes gravemente ferido ... Cuno finalmente começa a se mover e acorda, ele percebe a situação e nota que você está muito mal. Porém ele estava calmo. Algo estava errado, porém Felizmente errado!, pois o gatinho começa a se mover e Cuno decidi dar uma acariciada no Sr Bigode! e entao fala:\n\"Muito obrigado Senhor,Eu estou muito feliz e grato, Senhor bigodes perdeu uma de suas vidas, mas tudo bem pois estamos juntos denovo! , por favor senhor, pegue isto, o senhor bigodes disse que eu tenho que ir rápido, você também tem que ir!\"\nOque está acontecendo, uma vida? , é muita informação complexa vindo de uma criança para digerir. Você aceita o objeto perplexo e sem entender absolutamente nada que havia acabado de acontecer, o garoto e o gatinho correm e logo desaparecem de vista\n\"Isso foi realmente intenso... Saber que você preferiu isso ao perfeito vazio é lamentável...\"\nVocê perdeu tudo isso, você agora não terá mais paz até finalmente descobrir tudo, e isso pode lhe custar muita mais que apenas tempo, no vazio, não há oque perder... mas você tinha que acabar com isso não é!?, tudo bem , se prepare , essa é a ultima vez que te alerto, Você ainda pode parar...\nA chuva está mais forte, Ja é noite. Você está de frente para tv , Acabou de sentar após chegar em sua casa, você está observando o pequeno objeto que o garoto lhe entregou e assistindo ao jornal na tv:\n\"Hoje foi encontrado o Garoto que estava desaparecido há algumas semanas, Bigode , de 9 anos foi encontrado baleado no meio do bosque, de acordo com a autópsia, foi uma morta instantanea\"\nA imagem que aparece é a do garoto que você havia ajudado mais cedo...\nO palpitar novamente acelera... Oque você está sentido para isso acontecer!?"
        
        let negativeNeutral = "Voce então volta a olhar para a TV:\n\"Horário da morte, 16:45 é o que os especialistas indicam, não foram encontrados mais rastros...\"\nVoce começa a pensar:\n\"Por que estou me sentindo assim? o que é isso?\"\nDe repente você ativa o objeto que ganhou sem que perceba, um holograma aparece e junta com ele uma mensagem...\n\"Me procure...\"\n"
        
        return [historiaInicial, parte1Positive, negativeNegative, negativePositive, negativeNeutral]
    }

}
