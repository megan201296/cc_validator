#!/bash/bin

echo "Please enter your credit card number. "
read card_num
total=0

for (( i=0; i<${#card_num}; i++)); do
	num=${card_num:$i:1}
	if [ $((i % 2)) -eq 0 ]; then
		total=$((total + num))
	else
		num=$((2 * num))
		if [ $num -gt 9 ]; then
			num=$((${num:0:1} + ${num:1:1}));
		else
			num=$num
		fi
		total=$((total + num))
	fi
done

if [ $((total % 10)) -eq 0 ]; then
	echo "Card is Valid"
else
	echo "Card is Invalid"
fi