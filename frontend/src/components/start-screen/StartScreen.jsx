// import React, { useState } from "react";
import css from './StartScreen.module.css';
import logo from '../../assets/logo.svg';
// import startScreen from '../../assets/startScreen.png'
import Button from '../buttons/Button';
import { useNavigate } from 'react-router-dom';

const StartScreen = () => {
  const navigate = useNavigate();

  // const [isAddStyle, setIsAddStyle] = useState(false);

  const handleClick = async (event) => {
    event.preventDefault();

    // Обнуление сцены в локальном хранилище
    localStorage.removeItem('currentScene');

    // Переход на страницу игры
    navigate('/game');
  };

  return (
    <>
    
        <div className={css.startScreen}>
            {/* <img  src={startScreen}  alt="start screen"/> */}

            <img className={css.logo} src={logo} alt="logo" />
            <h1 className={css.title}>
            Земля-<span className={css.mainTitle}>2073</span>
            </h1>
            <div className={css.buttonsBlock}>
                <Button type="button" onClick={handleClick}>Новая игра</Button>
                <Button type="button" onClick={async event => {navigate('/game')}}>Продолжить</Button>
                <Button type="button" onClick={async event => {navigate('/')}}>Выход</Button>
            </div>
        </div>
      
      
    
    </>
  )
};

export default StartScreen;