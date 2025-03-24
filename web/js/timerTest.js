
$(() => {
    const options = (typeof yiiOptions === 'undefined' ? {} : yiiOptions);
    
    let diff = {
        hours: 0,
        minutes: 0,
        seconds: 0,
    };
    const endTime = (options?.endTimeTest ? options.endTimeTest : 0);
    const UPDATE_INTERVAL = 1000;
    let timerID = 0;

    const updateDiff = () => {
        const now = new Date();

        const result = new Date(endTime*1000 - now.getTime());

        if (result <= 0) {
            Object.assign(diff);
            $.post( $('#test-form').attr('action'), $('#test-form').serialize());
            return;
        }

        Object.assign(diff, {
            hours: result.getUTCHours(),
            minutes: result.getUTCMinutes(),
            seconds: result.getUTCSeconds(),
        });

        updateTimerValue(diff);
    };

    const updateTimerValue = (value) => {
        $('#timer-test').find('.timer-value').html(`${(value.hours < 10 ? ('0' + value.hours) : value.hours)}:${(value.minutes < 10 ? ('0' + value.minutes) : value.minutes)}:${(value.seconds < 10 ? ('0' + value.seconds) : value.seconds)}`);
    }

    timerID = setInterval(updateDiff, UPDATE_INTERVAL);
})

