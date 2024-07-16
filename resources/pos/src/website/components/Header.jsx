import {Image, Nav, Navbar} from "react-bootstrap-v5";
import React, {useEffect, useState} from "react";
import {Link, useNavigate} from "react-router-dom";
import {Filters, Tokens} from "../../constants";
import {useSelector} from "react-redux";
import {getFormattedMessage} from "../../shared/sharedMethod";

export const Header = (props) => {
    const { logoutAction, newRoutes, updateLanguage, selectedLanguage, productQuantityReportAction, productQuantityReport } = props;
    const navigate = useNavigate();
    const users = localStorage.getItem(Tokens.USER);
    const firstName = localStorage.getItem(Tokens.FIRST_NAME);
    const lastName = localStorage.getItem(Tokens.LAST_NAME);
    const token = localStorage.getItem(Tokens.ADMIN);
    const imageUrl = localStorage.getItem(Tokens.USER_IMAGE_URL);
    const image = localStorage.getItem(Tokens.IMAGE);
    const updatedEmail = localStorage.getItem(Tokens.UPDATED_EMAIL);
    const updatedFirstName = localStorage.getItem(Tokens.UPDATED_FIRST_NAME);
    const updatedLastName = localStorage.getItem(Tokens.UPDATED_LAST_NAME);
    const updatedLanguage = localStorage.getItem(Tokens.UPDATED_LANGUAGE)
    const [deleteModel, setDeleteModel] = useState(false);
    const [languageModel, setLanguageModel] = useState(false);
    const [isFullscreen, setIsFullscreen] = useState(false);
    const [warehouseValue, setWarehouseValue] = useState({ label: 'All', value: null });
    const [totalRecords, setTotalRecords] = useState(0)
    const [showPosRegisterModel, setShowPosRegisterModel] = useState(false)
    const { allConfigData } = useSelector(state => state)
    return (
        <Navbar collapseOnSelect expand='lg' className='align-items-stretch ms-auto py-1'>
            <div className='d-flex align-items-stretch justify-content-center'>
                <Nav className='align-items-stretch justify-content-between flex-row'>
                    <ul className='nav align-items-center'>
                        <li>
                            {newRoutes.map((route) => route.permission).filter(routeName => routeName === 'manage_pos_screen')[0] === 'manage_pos_screen'
                                ?
                                allConfigData?.open_register === true
                                    ?
                                    <button onClick={handleClickPOSBtn}
                                            className='px-sm-3 px-2 d-flex text-decoration-none pos-button pos-button-highlight'>
                                        {getFormattedMessage('header.pos.title')}
                                    </button>
                                    :
                                    <Link to='/app/pos'
                                          className='px-sm-3 px-2 d-flex text-decoration-none pos-button pos-button-highlight'>
                                        {getFormattedMessage('header.pos.title')}
                                    </Link>
                                :
                                ''
                            }
                        </li>
                    </ul>
                </Nav>
            </div>
        </Navbar>
    )
}
