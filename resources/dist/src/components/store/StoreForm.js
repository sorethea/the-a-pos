import React, {useState} from 'react';
import {useNavigate} from 'react-router-dom';
import {connect} from 'react-redux';
import Form from 'react-bootstrap/Form';
import {getFormattedMessage, numValidate, placeholderText} from '../../shared/sharedMethod';
import {editStore, fetchStore} from '../../store/action/storeAction';
import ModelFooter from '../../shared/components/modelFooter';

const StoreForm = (props) => {
    const {addStoreData, id, editStore, singleStore} = props;
    const navigate = useNavigate();

    const [storeValue, setStoreValue] = useState({
        name: singleStore ? singleStore[0].name : '',
        phone: singleStore ? singleStore[0].phone : '',
        address: singleStore ? singleStore[0].address : '',
        location: singleStore ? singleStore[0].location : '',
    });

    const [errors, setErrors] = useState({
        name: '',
        phone: '',
        address: '',
        location: '',
    });

    const disabled = singleStore
        && singleStore[0].name === storeValue.name
        && singleStore[0].phone === storeValue.phone
        && singleStore[0].address === storeValue.address
        && singleStore[0].location === storeValue.location

    const handleValidation = () => {
        let errorss = {};
        let isValid = false;
        if (!storeValue['name']) {
            errorss['name'] = getFormattedMessage('globally.input.name.validate.label');
        } else if (!storeValue['phone']) {
            errorss['phone'] = getFormattedMessage('globally.input.phone-number.validate.label');
        } else if (!storeValue['address']) {
            errorss['address'] = getFormattedMessage('globally.input.address.validate.label');
        } else if (!storeValue['location']) {
            errorss['location'] = getFormattedMessage('globally.input.location.validate.label');
        } else {
            isValid = true;
        }
        setErrors(errorss);
        return isValid;
    };

    const onChangeInput = (e) => {
        e.preventDefault();
        setStoreValue(inputs => ({...inputs, [e.target.name]: e.target.value}))
        setErrors('');
    };

    const onSubmit = (event) => {
        event.preventDefault();
        const valid = handleValidation();
        if (singleStore && valid) {
            if (!disabled) {
                editStore(id, storeValue, navigate);
            }
        } else {
            if (valid) {
                setStoreValue(storeValue);
                addStoreData(storeValue);
            }
        }
    };

    return (
        <div className='card'>
            <div className='card-body'>
                <Form>
                    <div className='row'>
                        <div className='col-md-6 mb-3'>
                            <label className='form-label'>
                                {getFormattedMessage('globally.input.name.label')}:
                            </label>
                            <span className='required'/>
                            <input type='text' name='name'
                                   placeholder={placeholderText('globally.input.name.placeholder.label')}
                                   className='form-control' autoFocus={true}
                                   onChange={(e) => onChangeInput(e)}
                                   value={storeValue.name}/>
                            <span
                                className='text-danger d-block fw-400 fs-small mt-2'>{errors['name'] ? errors['name'] : null}</span>
                        </div>
                        <div className='col-md-6 mb-3'>
                            <label className='form-label'>
                                {getFormattedMessage('globally.input.address.label')}:
                            </label>
                            <span className='required'/>
                            <input type='text' name='address' className='form-control' value={storeValue.address}
                                   placeholder={placeholderText('globally.input.address.placeholder.label')}
                                   onChange={(e) => onChangeInput(e)}/>
                            <span
                                className='text-danger d-block fw-400 fs-small mt-2'>{errors['address'] ? errors['address'] : null}</span>
                        </div>
                        <div className='col-md-6 mb-3'>
                            <label className='form-label'>
                                {getFormattedMessage('globally.input.phone-number.label')}:
                            </label>
                            <span className='required'/>
                            <input type='text' name='phone' className='form-control' pattern='[0-9]*'
                                   placeholder={placeholderText('globally.input.phone-number.placeholder.label')}
                                   onKeyPress={(event) => numValidate(event)}
                                   onChange={(e) => onChangeInput(e)}
                                   value={storeValue.phone}/>
                            <span
                                className='text-danger d-block fw-400 fs-small mt-2'>{errors['phone'] ? errors['phone'] : null}</span>
                        </div>
                        <div className='col-md-6 mb-3'>
                            <label className='form-label'>
                                {getFormattedMessage('globally.input.location.label')}:
                            </label>
                            <span className='required'/>
                            <input type='text' name='location' className='form-control'
                                   placeholder={placeholderText('globally.input.location.placeholder.label')}
                                   onChange={(e) => onChangeInput(e)}
                                   value={storeValue.location}/>
                            <span className='text-danger'>{errors['location'] ? errors['location'] : null}</span>
                        </div>
                        <ModelFooter onEditRecord={singleStore} onSubmit={onSubmit} editDisabled={disabled}
                                     link='/app/stores' addDisabled={!storeValue.name}/>
                    </div>
                </Form>
            </div>
        </div>
    )
};

export default connect(null, {fetchStore, editStore})(StoreForm);
