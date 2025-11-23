#!/bin/bash

# Atualizando os pacotes do sistema:
sudo apt update && sudo apt upgrade -y

# Verificando se o Docker está instalado
if ! [ -x "$(command -v docker)" ]; then
  echo "🐳 Docker não encontrado. Instalando Docker Engine e Compose Plugin..."
  sudo apt install ca-certificates curl gnupg lsb-release -y
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update
  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
else
  echo "Docker já instalado. Pulando..."
fi

# Habilitando e iniciando o serviço do Docker:
sudo systemctl enable docker
sudo systemctl start docker

# Verificando se o Docker Compose v2 está disponível
if docker compose version >/dev/null 2>&1; then
  echo "Docker Compose v2 detectado com sucesso!"
else
  echo "Docker Compose v2 não encontrado. Verifique a instalação."
  exit 1
fi

# Clonando o repositório da aplicação Python, se ainda não existir
echo "📥 Clonando o repositório da aplicação Python, se ainda não existir..."
if [ ! -d "./caringu-python" ]; then
  git clone https://github.com/VitalisTech-Brasil/caringu-python.git
fi

# Clonando o repositório da aplicação Front-end, se ainda não existir
echo "📥 Clonando o repositório da aplicação Front-end, se ainda não existir..."
if [ ! -d "./caringu-frontend" ]; then
  git clone https://github.com/VitalisTech-Brasil/caringu-frontend.git
fi

cd ./caringu-frontend/src/pages
cat <<EOF > Index.jsx
import bgImage from "../assets/images/primeira-imagem-fundo-index.svg";
import logoImage from '../assets/logos/caringu-logo-branco.svg'
import cardImage from '../assets/images/ginasio-sem-pessoas-interior_107420-6120.svg'
import cardImage2 from '../assets/images/Foto2CardsIndex.svg'
import cardImage3 from '../assets/images/Being A Personal Trainer_ Pros and Cons.svg'
import secondImage from '../assets/images/segunda-imagem-fundo-index.svg'
import Carrossel from "../components/Index/Carrossel";
import PerguntasFrequentes from "../components/Index/PerguntasFrequentes";
import Button from "../components/Utils/Button";
import { Link } from "react-router-dom";
import { useForm } from "react-hook-form";
import FaleConosco from "../components/Index/FaleConosco";
import MenuLateral from "../components/Index/MenuLateralIndex";

import logoLaranjaCaringu from '../assets/logos/caringu-logo-branco-fundo-laranja.svg';
import githubLogo from '../assets/logos/github-logo.svg';
import linkedinLogo from '../assets/logos/linkedin-logo.svg';
import instaLogo from '../assets/logos/instagram-logo.svg';
import CardObjetivo from "../components/Index/CardObjetivo";

export default function   HomePage() {
  const scrollToSection = (id) => {
    const section = document.getElementById(id);
    if (section) {
      section.scrollIntoView({ behavior: 'smooth' });
    }
  };

  const { register, handleSubmit, control, formState: { errors } } = useForm();

  const objetivos = [
    {
      titulo: "Pesquisas com personal trainers",
      subTitulo: "Buscamos entender o personal e nos colocar no seu lugar para entender suas dores.",
      descricao: "Para isso, passamos por uma série de pesquisas com aprofundamento das dificuldades do profissional da área.",
      image:cardImage
    },
    {
      titulo: "Foco nos alunos",
      subTitulo: "Criamos a CaringU pensando na experiência dos alunos com foco em progresso e personalização.",
      descricao: "Queremos tornar a jornada de treino mais engajadora, aumentando a disciplina e o alcance de resultados reais.",
      image:cardImage2
    },
    {
      titulo: "Resultado",
      subTitulo: "Desenvolvemos uma solução prática que conta com funções que buscam suprir a necessidade de organização do personal.",
      descricao: "Como gerenciamento de alunos, agenda e relatórios para acompanhar o desempenho do aluno.",
      image:cardImage3
    }

  ];


  return (
    <>
      <MenuLateral />

      {/* Header principal (desktop) */}
      <header className="max-[800px]:fixed min-[800px]:absolute top-0 left-0 z-11 w-full h-[80px] flex items-center bg-[#000001] md:bg-transparent justify-between text-white px-8 pl-20 pr-20">
        {/* Menu de navegação — some abaixo de 800px */}
        <nav className="hidden min-[800px]:flex gap-8 m-4 justify-center items-center h-16 w-[400px] rounded-[6px]
                        max-[1050px]:gap-4 max-[1050px]:w-[320px] max-[1050px]:text-[12px] max-[1050px]:h-[48px] max-[900px]:w-[300px] max-[900px]:text-[10px] 
                        max-[900px]:gap-2">
          <a className="hover:underline font-bold text-[14px] cursor-pointer transition-all max-[1050px]:text-[12px]"
            onClick={() => scrollToSection('home')}>Home</a>
          <a className="hover:underline font-bold text-[14px] cursor-pointer transition-all max-[1050px]:text-[12px]"
            onClick={() => scrollToSection('sobre')}>Sobre nós</a>
          <a className="hover:underline font-bold text-[14px] cursor-pointer transition-all max-[1050px]:text-[12px]"
            onClick={() => scrollToSection('servicos')}>Serviços</a>
          <a className="hover:underline font-bold text-[14px] cursor-pointer transition-all max-[1050px]:text-[12px]"
            onClick={() => scrollToSection('fale')}>Fale conosco</a>
        </nav>

        {/* Logo sempre visível */}
        <div className="flex-1 flex justify-center items-center">
          <img src={logoImage} alt="Logo CaringU" className="h-[50px] max-[1050px]:h-[30px] max-[800px]:h-[40px]" />
        </div>

        {/* Botões Inscreva-se e Entrar — somem abaixo de 800px */}
        <div className="hidden min-[800px]:flex gap-16 items-center w-[300px] justify-end
                        max-[1050px]:gap-8 max-[1050px]:w-[240px] max-[1050px]:text-[12px] max-[900px]:gap-4:">
          <Link to="/cadastro"
            className="font-bold text-[14px] cursor-pointer hover:underline transition-all max-[1050px]:text-[12px]">
            Inscreva-se
          </Link>
          <Link to="/login">
            <Button
              texto="Entrar"
              cor="var(--laranja)"
              corTexto="var(--cor-secundaria)"
              width="80px"
              height="40px"
              fontSize="14px"
              className="max-[1050px]:text-[12px] max-[1050px]:w-[70px] max-[1050px]:h-[36px] max-[1000px]:h-[30px]"
            />
          </Link>
        </div>
      </header>
      <section id="home" className="relative w-full h-screen bg-cover flex items-start" style={{ backgroundImage: `url(${bgImage})` }}>
        <div className="absolute inset-0 bg-black opacity-60" />
        <div className="relative z-10 flex flex-col justify-center items-start h-full text-white max-w-250 mx-25 max-lg:mx-16 max-sm:mx-6 max-md:mx-10">
          <p className="text-[64px] font-extrabold mb-6 max-[700px]:text-[56px] max-[525px]:text-[48px] max-[500px]:text-[40px] max-[500px]:w-[380px] max-[425px]:text-[32px] max-[425px]:w-[325px]">
            Transforme seu treino com a CaringU
          </p>
          <p className="text-[24px] mb-8 max-w-160 max-[700px]:text-[20px] max-[525px]:text-[16px] max-[500px]:w-[370px] max-[425px]:w-[300px]">
            A CaringU facilita a gestão, conecta você a novos alunos e otimiza a comunicação, permitindo focar no que importa: Transformar vidas através do treino.
          </p>
          <Link to="/cadastro"><Button texto="Cadastre-se" cor="var(--laranja)" corTexto="var(--cor-secundaria)" width="200px" height="50px" fontSize="18px" /></Link>
        </div>
      </section>
      <section id="sobre" className="h-screen w-full bg-[var(--cor-secundaria)]">
        <div className="flex flex-col items-center justify-center gap-4 h-1/3 w-full mb-2
          max-[1050px]:mb-4
          max-[700px]:mb-6
          max-[500px]:mb-8
          max-[425px]:mb-10">
          <h1 className="text-[48px] font-bold max-[1300px]:text-[40px] max-[1050px]:text-[36px] max-[850px]:text-[28px] max-[415px]:text-[24px]">Por que criamos a CaringU?</h1>
          <p className="text-[24px] max-w-300  text-center max-[1300px]:text-[20px] max-[1300px]:w-[1000px] max-[1050px]:text-[18px] max-[1050px]:w-[800px] max-[850px]:w-[600px] max-[650px]:w-[500px] max-[525px]:w-[400px] max-[525px]:text-[16px] max-[415px]:w-[300px] max-[415px]:text-[16px]">
            A  <b>CaringU</b> surgiu com o objetivo de conectar os personal trainers com seus alunos e facilitar a organização dos treinos, exercícios e aulas agendadas.
          </p>
        </div>
        <div className="flex items-center justify-center gap-4 h-1/2 flex-col md:flex-col lg:flex-row">
          {objetivos.map((obj, index) => (
            <CardObjetivo
              key={index}
              titulo={obj.titulo}
              subTitulo={obj.subTitulo}
              descricao={obj.descricao}
              image={obj.image}
            />
          ))}
        </div>
      </section>
      <section id="servicos" className="h-screen w-full relative bg-cover flex items-start flex-col" style={{ backgroundImage: `url(${secondImage})` }}>
        <div className="absolute inset-0 bg-black opacity-80" />
        <div className="relative z-1 flex flex-col justify-center items-center h-1/2 text-white w-full">
          <h1 className="text-[48px] font-bold max-[850px]:text-[40px] max-[580px]:text-[32px]">
            Nossas soluções
          </h1>
          <p className="text-center max-w-4xl text-base lg:text-[24px] md:text-[20px] max-[850px]:w-[650px]  max-[680px]:w-[550px] max-[580px]:w-[430px]  max-[400px]:w-[280px]">As soluções implementadas na CaringU foram construídas sob medida para auxiliar os Personal Trainers em suas dores do dia a dia.</p>
        </div>
        <div className="w-full h-1/3 flex justify-center items-center">
          <Carrossel />
        </div>
      </section>
      <section id="perguntas-frequentes" className="mt-10 w-full bg-[var(--cor-secundaria)] flex flex-col items-center justify-center">
        <div className="flex flex-col items-center justify-center gap-4 h-1/3">
          <h1 className="text-[48px] font-bold max-[700px]:text-[40px] max-[500px]:text-[32px] max-[425px]:text-[28px]">
            Perguntas Frequentes
          </h1>
          <PerguntasFrequentes />
        </div>
      </section>
      <FaleConosco />
      <footer className="h-auto py-8 lg:px-20 px-12 w-full bg-[var(--azul-escuro)] flex items-center justify-center flex-col">
        <div className="flex items-center md:flex-row flex-col w-full gap-10 md:gap-0 justify-between">
          <div className="lg:w-[80%] md:w-[65%] w-full">
            <div>
              <img src={logoLaranjaCaringu} alt="Logo CaringU" className="w-[200px] lg:h-[90px] lg:w-[350px]" />
            </div>
            <div className="flex flex-col gap-2 mt-4 ">
              <h1 className="text-white text-xl font-bold w-full md:w-90 lg:w-138 ">Transforme seu treino com mais facilidade</h1>
              <p className="text-white text-base w-full md:w-90 lg:w-138">
                Elevamos sua experiência fitness, conectando você ao personal ideal para seus objetivos, tornando sua jornada mais eficiente e motivadora.
              </p>
            </div>
          </div>
          <div className="flex flex-row items-center md:gap-0 gap-20  md:justify-between lg:w-[20%] md:w-[35%] w-full h-full ">
            <div className="flex flex-col gap-3">
              <h1 className="text-white text-xl font-bold ">
                Navegação
              </h1>
              <div className="flex flex-col items-start justify-center text-base gap-3">
                <a style={{ color: "var(--cor-secundaria)" }} onClick={() => scrollToSection('home')}>Home</a>
                <a style={{ color: "var(--cor-secundaria)" }} onClick={() => scrollToSection('sobre')}>Sobre nós</a>
                <a style={{ color: "var(--cor-secundaria)" }} onClick={() => scrollToSection('servicos')}>Serviços</a>
                <a style={{ color: "var(--cor-secundaria)" }} onClick={() => scrollToSection('fale')}>Fale conosco</a>
                <Link style={{ color: "var(--cor-secundaria)" }} to="/login" >Entrar</Link>
                <Link style={{ color: "var(--cor-secundaria)" }} to="/cadastro">Inscreva-se</Link>
              </div>
            </div>
            <div className="flex flex-col items-start  gap-5">
              <img src={githubLogo} alt="Logo Github" className="h-[30px] w-[30px] cursor-pointer transition-all hover:scale-110 flex-shrink-0" />
              <img src={linkedinLogo} alt="Logo Linkedin" className="h-[30px] w-[30px] cursor-pointer transition-all hover:scale-110" />
              <img src={instaLogo} alt="Logo Instagram" className="h-[30px] w-[30px] cursor-pointer transition-all hover:scale-110" />
            </div>
          </div>
        </div>
        <p className="text-white text-base mt-3 ">Copyright © CaringU. All Rights Reserved.</p>

      </footer>
    </>
  );
}
EOF


# 🔨 Buildando as imagens com Docker Compose v2
echo "[*] Buildando as imagens de Frontend + Python com Docker Compose..."
sudo docker compose build

# [*] Subindo os containers com Docker Compose...
echo "[*] Subindo os containers de Frontend + Python com Docker Compose..."
sudo docker compose up -d

echo "✅ Ambiente de Frontend + Python criado com sucesso!"