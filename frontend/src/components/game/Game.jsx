import React, {useState, useEffect} from "react";
import {useNavigate} from 'react-router-dom';
// import StartScreen from "./StartScreen";
import Button from "../buttons/Button";
import DarkButton from "../buttons/DarkButton";
import TypewriterText from './TypewriterText';
import css from '../game/Game.module.css';
import classNames from 'classnames';

const Games = () => {
    const [dialogues, setDialogues] = useState([]); // в этот массив придет dialogues
    const navigate = useNavigate();
    const typingSpeed = 24; //Скорость печати в миллисекундах
    const [currentScene, setCurrentScene] = useState(0);
    const [isAddStyle, setIsAddStyle] = useState(true);
    // const [currentWindowIndex, setCurrentWindowIndex] = useState(0); //для сохранения в локал текущего диалога
    const [currentDialog, setCurrentDialog] = useState(0);
    const [nextDialog, setNextDialog] = useState(false);

    useEffect(() => {
        //Получение данных из localStorage
        const savedScene = parseInt(localStorage.getItem('currentScene') ?? 0);
        if (savedScene) {
            setCurrentScene(savedScene);
        }
        fetchDialogs();
        console.log(savedScene);

    }, []);

    const fetchDialogs = async () => {
        try {
            const response = await fetch('https://latikdesu.art/api/dialog/', {
                method: 'POST',
                // Дополнительные параметры запроса, если необходимо
                headers: {
                    'Content-Type': 'application/json',
                    // Другие заголовки, если необходимо
                },
                body: JSON.stringify({start: '0', end: '0'}),
            });

            if (response.ok) {
                const data = await response.json();
                setDialogues(data.dialogues);
                console.log(data.dialogues);
                // localStorage.setItem("dialogues", JSON.stringify(data.dialogues));
            } else {
                console.error('Ошибка получения диалогов:', response.status);
            }
        } catch (error) {
            console.error('Ошибка:', error);
        }
    };


    // const backgroundImageStyle = {
    //   backgroundImage: `url(${require('../../'+dialogues[currentScene].scene[0].path_img)})`,
    //   backgroundSize: "cover",
    //   backgroundPosition: "center",
    //   transition: "background-image 0.5s ease-in-out",
    // };

    const handlePrevDialog = () => {
        let dialogLength = dialogues[currentScene].windows.length;

        if (currentDialog === 0 && currentScene !== 0) {
            setCurrentScene(currentScene - 1);
            dialogLength = dialogues[currentScene - 1].windows.length;
            setCurrentDialog(dialogLength - 1);
            return;
        }

        if (currentDialog === 0 && currentScene === 0) {
            return;
        }

        if (currentDialog < dialogLength) {
            setCurrentDialog(currentDialog - 1);
            // setIsAddStyle(true);
        }
    };

    const handleNextDialog = () => {
        const dialogLength = dialogues[currentScene].windows.length;
        const sceneLength = dialogues.length - 1;

        if (currentDialog < dialogLength - 1) {
            setCurrentDialog(currentDialog + 1);
            setNextDialog(true);
            return;
            // setIsAddStyle(true);
        }

        if (currentScene === sceneLength) {

            console.log("Конец");
            localStorage.setItem("currentScene", '0')
            return;
        }

        setCurrentScene(currentScene + 1);
        setNextDialog(true);
        localStorage.setItem("currentScene", currentScene + 1);
        console.log(localStorage);
        setCurrentDialog(0);
        setIsAddStyle(true);
    };


    return (

        <div>
            {dialogues.length ? (
                <div className={classNames(css.scene, isAddStyle ? 'css.sceneFade' : '')}>
                    {/* <img className={css.sceneImg} src={dialogues[currentScene].scene[0].path_img}  alt={dialogues[currentScene].scene[0].name}/> */}
                    <img className={css.sceneImg} src={require('../../' + dialogues[currentScene].scene[0].path_img)}
                         alt={dialogues[currentScene].scene[0].name}/>
                    <div className={css.backMain}>
                        <Button onClick={async event => {
                            navigate('/start')
                        }}>Главная страница</Button>
                    </div>
                    {dialogues[currentScene].windows[currentDialog].position === 'left' ? (
                        <div className={css.positionLeft}>
                            <img className={css.positionChar}
                                 src={require('../../' + dialogues[currentScene].windows[currentDialog].path_img)}
                                 alt={dialogues[currentScene].windows[currentDialog].character}/>
                        </div>
                    ) : (
                        <div className={css.positionRight}>
                            <img className={css.positionChar}
                                 src={require('../../' + dialogues[currentScene].windows[currentDialog].path_img)}
                                 alt={dialogues[currentScene].windows[currentDialog].character}/>
                        </div>
                    )}
                    {/* <div className={css.positionRight}>
                <img className={css.positionChar} src={require('../../'+dialogues[currentScene].windows[currentDialog].path_img)} alt={dialogues[currentScene].windows[currentDialog].character}/>
              </div>   */}
                    <div className={css.window}>
                        <div className={css.character}>{dialogues[currentScene].windows[currentDialog].character}</div>
                        <div className={css.message}>
                            <TypewriterText
                                text={dialogues[currentScene].windows[currentDialog].text}
                                speed={typingSpeed}
                                nextDialog={nextDialog}
                            />
                            {/* {dialogues[currentScene].windows[currentDialog].text} */}
                        </div>
                        <div className={css.buttons}>
                            <DarkButton onClick={handlePrevDialog}>Назад</DarkButton>
                            <DarkButton onClick={handleNextDialog}>Далее</DarkButton>
                        </div>
                    </div>
                </div>) : (
                // Отображаем загрузочный экран или спиннер
                <p>Loading...</p>
            )}
        </div>

    )
};

export default Games;